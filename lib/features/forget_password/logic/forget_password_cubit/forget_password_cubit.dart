import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universe/core/constants/shared_pref_helper.dart';
import 'package:universe/core/constants/shared_pref_keys.dart';
import 'package:universe/core/networking/dio_factory.dart';
import 'package:universe/core/networking/server_result.dart';
import '../../data/models/forget_password_model/forget_pass_request_body.dart';
import '../../data/repos/forget_pass_repo.dart';
import 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this._forgetPassRepo)
      : super(const ForgetPasswordState.initial());

  final ForgetPassRepo _forgetPassRepo;

  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> loadSavedEmail() async {
    String? savedEmail =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userEmail);
    if (emailController.text.isEmpty) {
      emailController.text = savedEmail;
      log("Loaded Email: $savedEmail");
    }
  }

  Future<void> emitForgetPasswordStates() async {
    await loadSavedEmail();
    emit(const ForgetPasswordState.loading());

    final response = await _forgetPassRepo.forgetPassword(
      ForgetPassRequestBody(email: emailController.text),
    );

    response.when(
      success: (forgetPassResponse) async {
        await saveUserToken(forgetPassResponse.token ?? '');
        await saveEmail();
        emit(ForgetPasswordState.success(forgetPassResponse));
      },
      failure: (errorHandler) {
        emit(
          ForgetPasswordState.error(
            error: errorHandler.serverFailure.errmessage,
          ),
        );
      },
    );
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.resetToken, token);
    DioFactory.setTokenIntoHeaderAfterSignUp(token);
    log("Saved Token: ${await SharedPrefHelper.getSecuredString(SharedPrefKeys.resetToken)}");
  }

  Future<void> saveEmail() async {
    await SharedPrefHelper.setSecuredString(
        SharedPrefKeys.userEmail, emailController.text);
    log("Saved Email: ${await SharedPrefHelper.getSecuredString(SharedPrefKeys.userEmail)}");
  }
}
