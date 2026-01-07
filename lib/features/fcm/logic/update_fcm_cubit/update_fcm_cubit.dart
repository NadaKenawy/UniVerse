import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universe/core/constants/shared_pref_helper.dart';
import 'package:universe/core/constants/shared_pref_keys.dart';
import 'package:universe/core/networking/server_result.dart';
import '../../data/repos/update_fcm_repo.dart';
import 'update_fcm_state.dart';

class UpdateFcmCubit extends Cubit<UpdateFcmState> {
  UpdateFcmCubit(this._updateFcmRepo) : super(const UpdateFcmState.initial());

  final UpdateFcmRepo _updateFcmRepo;
  String? _deviceToken;

  Future<void> initializeAndSendToken() async {
    await _getDeviceToken();
    if (_deviceToken != null) {
      await _updateFcmToken();
      await _initializeNotifications();
    } else {
      log('FCM token is null. Skipping update.');
    }
  }

  Future<void> _getDeviceToken() async {
    try {
      _deviceToken = await FirebaseMessaging.instance.getToken();
      log('🔑 FCM token: $_deviceToken');
    } catch (e) {
      log('❌ Error fetching FCM token: $e');
    }
  }

  /// Send the token to your backend server
  Future<void> _updateFcmToken() async {
    if (_deviceToken == null) return;

    emit(const UpdateFcmState.updateFcmLoading());

    final authToken = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );

    if (authToken.isEmpty) {
      log('❌ Auth token is empty');
      emit(const UpdateFcmState.updateFcmError(error: 'User not logged in'));
      return;
    }

    final cleanToken = authToken.startsWith('Bearer ')
        ? authToken.substring(7)
        : authToken;

    final response = await _updateFcmRepo.updateFcm(cleanToken, _deviceToken!);

    response.when(
      success: (data) {
        log('✅ FCM token updated successfully: ${data.message}');
        emit(UpdateFcmState.updateFcmSuccess(data));
      },
      failure: (error) {
        log('❌ FCM token update failed: ${error.serverFailure.errmessage}');
        if (error.serverFailure.errmessage.toLowerCase().contains(
          'invalid token',
        )) {
          log('⚠️ Token might be expired. User needs to login again.');
          emit(
            const UpdateFcmState.updateFcmError(
              error: 'User needs to login again',
            ),
          );
        } else {
          emit(
            UpdateFcmState.updateFcmError(
              error: error.serverFailure.errmessage,
            ),
          );
        }
      },
    );
  }

  Future<void> _initializeNotifications() async {
    // Register background handler
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    final settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    log('📬 Notification permissions: ${settings.authorizationStatus}');

    FirebaseMessaging.onMessage.listen((message) {
      log(
        '📨 Foreground message: ${message.notification?.title} - ${message.notification?.body}',
      );
    });

    FirebaseMessaging.onMessageOpenedApp.listen(_handleNotificationTap);

    // Handle initial message when app is launched from terminated state
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) _handleNotificationTap(initialMessage);
  }

  void _handleNotificationTap(RemoteMessage message) =>
      log('👆 Notification tapped: ${message.data}');

  static Future<void> _firebaseMessagingBackgroundHandler(
    RemoteMessage message,
  ) async {
    log('📨 Background message: ${message.data}');
  }
}
