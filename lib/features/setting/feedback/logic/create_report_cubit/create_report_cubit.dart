import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universe/core/constants/shared_pref_helper.dart';
import 'package:universe/core/constants/shared_pref_keys.dart';
import 'package:universe/core/networking/server_result.dart';

import '../../data/models/create_report/create_report_request_body.dart';
import '../../data/repo/create_report_repo.dart';
import 'create_report_state.dart';

class CreateReportCubit extends Cubit<CreateReportState> {
  CreateReportCubit(this._createReportRepo)
      : super(const CreateReportState.initial());

  final CreateReportRepo _createReportRepo;

  TextEditingController review = TextEditingController();

  void emitCreateReportStates(dynamic ratings) async {
    emit(const CreateReportState.loading());

    String token = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );

    final response = await _createReportRepo.createReport(
      CreateReportRequestBody(
        title: review.text,
        ratings: ratings,
      ),
      token,
    );
    response.when(
      success: (createReportResponse) async {
       
      
        emit(CreateReportState.success(createReportResponse));
      },
      failure: (errorHandler) {
        emit(CreateReportState.error(error: errorHandler.serverFailure.errmessage));
      },
    );
  }
}
