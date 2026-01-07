import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universe/core/constants/shared_pref_helper.dart';
import 'package:universe/core/constants/shared_pref_keys.dart';
import 'package:universe/core/constants/user_cubit.dart';
import 'package:universe/core/constants/user_model.dart';
import 'package:universe/core/di/service_locator.dart';
import 'package:universe/core/networking/server_result.dart';
import 'package:universe/features/fcm/logic/update_fcm_cubit/update_fcm_cubit.dart';
import '../data/models/login_request_body.dart';
import '../data/repos/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo, this.userCubit)
    : super(const LoginState.initial());

  final LoginRepo _loginRepo;
  final UserCubit userCubit;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> emitLoginStates() async {
    emit(const LoginState.loading());

    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ),
    );

    response.when(
      success: (loginResponse) async {
        final token = loginResponse.token ?? '';
        await saveUserToken(token);

        if (loginResponse.data != null) {
          final userModel = UserModel.fromJson({
            'data': loginResponse.data!.toJson(),
            'token': loginResponse.token,
          });

          userCubit.setUser(userModel);

          log('👤 Logged in successfully: ${userModel.toJson()}');

          // Initialize FCM after successful login
          try {
            await getIt<UpdateFcmCubit>().initializeAndSendToken();
          } catch (e) {
            log('⚠️ Failed to initialize FCM: $e');
          }
        }

        emit(LoginState.success(loginResponse));
      },
      failure: (errorHandler) {
        emit(LoginState.error(error: errorHandler.serverFailure.errmessage));
      },
    );
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    log(
      "✅ Saved Token: ${await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken)}",
    );
  }

  void clearControllers() {
    emailController.clear();
    passwordController.clear();
  }
}
