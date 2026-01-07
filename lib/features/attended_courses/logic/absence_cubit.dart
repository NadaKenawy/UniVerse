import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universe/core/constants/shared_pref_helper.dart';
import 'package:universe/core/constants/shared_pref_keys.dart';
import 'package:universe/core/networking/server_result.dart';
import 'package:universe/features/attended_courses/data/repo/absence_repo.dart';
import 'package:universe/features/attended_courses/logic/absence_state.dart';


class AbsenceCubit extends Cubit<AbsenceState> {
  final AbsenceRepo _absenceRepo;

  AbsenceCubit(this._absenceRepo)
      : super(const AbsenceState.initial());

  Future<void> fetchAbsencePercentage({
    required String type,
  }) async {
    emit(const AbsenceState.loading());

    final token = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );

    if (token.isEmpty) {
      log('📊 No token found');
      emit(const AbsenceState.error(
          error: 'No token found'));
      return;
    }

    final response =
        await _absenceRepo.getAbsencePercentage(
      token: token,
      type: type,
    );

    response.when(
      success: (data) {
        log('📊 Absence data loaded');
        emit(AbsenceState.success(data));
      },
      failure: (errorHandler) {
        emit(
          AbsenceState.error(
            error:
                errorHandler.serverFailure.errmessage,
          ),
        );
      },
    );
  }
}
