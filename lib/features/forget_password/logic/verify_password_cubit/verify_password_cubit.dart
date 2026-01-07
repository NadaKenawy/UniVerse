import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universe/core/constants/shared_pref_helper.dart';
import 'package:universe/core/constants/shared_pref_keys.dart';
import 'package:universe/core/networking/server_result.dart';
import '../../data/models/verify_password_model/verify_password_request_body.dart';
import '../../data/repos/verify_password_repo.dart';
import 'verify_password_state.dart';

class VerifyPasswordCubit extends Cubit<VerifyPasswordState> {
  VerifyPasswordCubit(this._verifyPasswordRepo)
      : super(const VerifyPasswordState.initial());

  final VerifyPasswordRepo _verifyPasswordRepo;

  final TextEditingController otpField = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> emitVerifyPasswordStates() async {
    emit(const VerifyPasswordState.loading());

    String token = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.resetToken,
    );

    final response = await _verifyPasswordRepo.forget(
      VerifyPasswordRequestBody(resetCode: otpField.text),
      token,
    );

    response.when(
      success: (verifyPasswordResponse) {
        emit(VerifyPasswordState.success(verifyPasswordResponse));
      },
      failure: (errorHandler) {
        emit(
          VerifyPasswordState.error(
            error: errorHandler.serverFailure.errmessage,
          ),
        );
      },
    );
  }
}
