import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universe/core/constants/shared_pref_helper.dart';
import 'package:universe/core/constants/shared_pref_keys.dart';
import 'package:universe/core/networking/server_result.dart';
import 'package:universe/features/setting/add_complaint/data/model/add_complaint_request_body.dart';
import 'package:universe/features/setting/add_complaint/data/repo/complaint_repo.dart';
import 'complaint_state.dart';

class ComplaintCubit extends Cubit<ComplaintState> {
  ComplaintCubit(this._complaintRepo)
      : super(const ComplaintState.initial());

  final ComplaintRepo _complaintRepo;

  final TextEditingController subjectController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> emitAddComplaintStates() async {
    emit(const ComplaintState.loading());

    final token = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );

    final response = await _complaintRepo.addComplaint(
      AddComplaintRequestBody(
        subject: subjectController.text.trim(),
      ),
      token,
    );

    response.when(
      success: (addComplaintResponse) {
        log('✅ Complaint added successfully');
        emit(ComplaintState.success(addComplaintResponse));
      },
      failure: (errorHandler) {
        emit(
          ComplaintState.error(
            error: errorHandler.serverFailure.errmessage,
          ),
        );
      },
    );
  }

  void clearController() {
    subjectController.clear();
  }
}
