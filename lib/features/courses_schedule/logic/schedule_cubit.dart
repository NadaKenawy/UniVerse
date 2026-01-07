import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universe/core/constants/shared_pref_helper.dart';
import 'package:universe/core/constants/shared_pref_keys.dart';
import 'package:universe/core/networking/server_result.dart';
import 'package:universe/features/courses_schedule/data/repo/schedule_repo.dart';
import 'schedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  final ScheduleRepo _scheduleRepo;

  ScheduleCubit(this._scheduleRepo) : super(const ScheduleState.initial());

  Future<void> fetchSchedule({String? day}) async {
    emit(const ScheduleState.loading());

    final token = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );

    if (token.isEmpty) {
      log('📅 No token found');
      emit(const ScheduleState.error(error: 'No token found'));
      return;
    }

    final response = await _scheduleRepo.getStudentSchedule(
      token: token,
      day: day,
    );

    response.when(
      success: (scheduleData) {
        log('📅 Schedule loaded successfully');
        emit(ScheduleState.success(scheduleData));
      },
      failure: (errorHandler) {
        log('📅 Error: ${errorHandler.serverFailure.errmessage}');
        emit(ScheduleState.error(error: errorHandler.serverFailure.errmessage));
      },
    );
  }
}
