import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universe/core/constants/shared_pref_helper.dart';
import 'package:universe/core/constants/shared_pref_keys.dart';
import 'package:universe/core/networking/server_result.dart';

import '../../data/models/create_new_password_model/create_new_password_request_body.dart';
import '../../data/repos/create_new_password.dart';
import 'create_new_password_state.dart';

class CreateNewPasswordCubit extends Cubit<CreatePasswordState> {
  CreateNewPasswordCubit(this._createNewPasswordRepo)
    : super(const CreatePasswordState.initial());

  final CreateNewPasswordRepo _createNewPasswordRepo;

  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> emitCreateNewPasswordStates() async {
    emit(const CreatePasswordState.createNewPasswordloading());

    String? token = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.resetToken,
    );

    final response = await _createNewPasswordRepo.createNewPassword(
      CreateNewPasswordRequestBody(
        newPassword: newPasswordController.text,
        passwordConfirm: passwordConfirmController.text,
      ),
      token,
    );

    response.when(
      success: (_) {
        emit(
          const CreatePasswordState.createNewPasswordsuccess(
            message: 'Password created successfully!',
          ),
        );
      },
      failure: (errorHandler) {
        emit(
          CreatePasswordState.createNewPassworderrorerror(
            error: errorHandler.serverFailure.errmessage,
          ),
        );
      },
    );
  }
}
