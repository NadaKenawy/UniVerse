import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:universe/core/constants/shared_pref_helper.dart';
import 'package:universe/core/constants/shared_pref_keys.dart';
import 'package:universe/core/networking/server_result.dart';
import '../../data/repos/update_fcm_repo.dart';
import 'update_fcm_state.dart';

class UpdateFcmCubit extends Cubit<UpdateFcmState> {
  UpdateFcmCubit(this._updateFcmRepo)
      : super(const UpdateFcmState.initial());

  final UpdateFcmRepo _updateFcmRepo;

  final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  String? _deviceToken;

  Future<void> initializeAndSendToken() async {
    await _requestPermission();
    await _initializeLocalNotifications();
    await _getDeviceToken();

    if (_deviceToken != null) {
      await _updateFcmToken();
    } else {
      log('❌ FCM token is null');
    }

    _listenToNotifications();
  }

  Future<void> _requestPermission() async {
    final settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    log('📬 Permission status: ${settings.authorizationStatus}');
  }
  Future<void> _getDeviceToken() async {
    try {
      _deviceToken = await FirebaseMessaging.instance.getToken();
      log('🔑 FCM Token: $_deviceToken');
    } catch (e) {
      log('❌ Error getting FCM token: $e');
    }
  }

  Future<void> _updateFcmToken() async {
    emit(const UpdateFcmState.updateFcmLoading());

    final authToken = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );

    if (authToken.isEmpty) {
      emit(
        const UpdateFcmState.updateFcmError(
          error: 'User not logged in',
        ),
      );
      return;
    }

    final cleanToken =
        authToken.startsWith('Bearer ')
            ? authToken.substring(7)
            : authToken;

    final response =
        await _updateFcmRepo.updateFcm(cleanToken, _deviceToken!);

    response.when(
      success: (data) {
        log('✅ FCM token updated: ${data.message}');
        emit(UpdateFcmState.updateFcmSuccess(data));
      },
      failure: (error) {
        log('❌ Update failed: ${error.serverFailure.errmessage}');
        emit(
          UpdateFcmState.updateFcmError(
            error: error.serverFailure.errmessage,
          ),
        );
      },
    );
  }

  Future<void> _initializeLocalNotifications() async {
    const androidChannel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'Important notifications',
      importance: Importance.high,
    );

    await _localNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidChannel);

    const initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@drawable/ic_notification'),
      iOS: DarwinInitializationSettings(),
    );

    await _localNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        log('👆 Notification clicked: ${details.payload}');
      },
    );
  }

  void _listenToNotifications() {
    FirebaseMessaging.onBackgroundMessage(
      _firebaseMessagingBackgroundHandler,
    );

    FirebaseMessaging.onMessage.listen(_showNotification);

    FirebaseMessaging.onMessageOpenedApp.listen(_handleNotificationTap);

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        _handleNotificationTap(message);
      }
    });
  }

  Future<void> _showNotification(RemoteMessage message) async {
    final notification = message.notification;
    final android = message.notification?.android;

    if (notification == null || android == null) return;

    await _localNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'high_importance_channel',
          'High Importance Notifications',
          channelDescription: 'Important notifications',
          importance: Importance.high,
          priority: Priority.high,
          icon: 'ic_notification',
        ),
      ),
    );
  }

  void _handleNotificationTap(RemoteMessage message) {
    log('📦 Notification data: ${message.data}');
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
    RemoteMessage message,
  ) async {
    log('📨 Background message: ${message.data}');
  }
}
