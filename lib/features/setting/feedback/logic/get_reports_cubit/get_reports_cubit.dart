import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universe/core/constants/shared_pref_helper.dart';
import 'package:universe/core/constants/shared_pref_keys.dart';
import 'package:universe/core/networking/server_result.dart';
import 'package:universe/features/setting/feedback/data/repo/get_reports_repo.dart';

import 'get_reports_state.dart';

class GetReportsCubit extends Cubit<GetReportsState> {
  GetReportsCubit(this._getFeedbacksRepo)
    : super(const GetReportsState.initial()) {
    getFeedbacks(); 
  }

  final GetReportsRepo _getFeedbacksRepo;

  void getFeedbacks() async {
    emit(const GetReportsState.loading());
    String token = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );

    if (token.isEmpty) {
      log('📝 GetFeedbacks: No token found');
      emit(const GetReportsState.error(error: 'No token found. Please login again.'));
      return;
    }

    log('📝 GetFeedbacks: Fetching feedbacks with token: ${token.substring(0, 10)}...');

    final response = await _getFeedbacksRepo.getFeedbacks(token);

    response.when(
      success: (response) {
        log('📝 GetFeedbacks: Success - ${response.reports.length} reports found');
        emit(GetReportsState.success(response));
      },
      failure: (errorHandler) {
        log('📝 GetFeedbacks: Failure - ${errorHandler.serverFailure.errmessage}');
        emit(
          GetReportsState.error(error: errorHandler.serverFailure.errmessage),
        );
      },
    );
  }
}
