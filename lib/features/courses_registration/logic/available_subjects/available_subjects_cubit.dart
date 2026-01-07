import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universe/core/constants/shared_pref_helper.dart';
import 'package:universe/core/constants/shared_pref_keys.dart';
import 'package:universe/core/networking/server_result.dart';
import 'package:universe/features/courses_registration/data/repos/available_subjects_repo.dart';
import 'available_subjects_state.dart';

class AvailableSubjectsCubit
    extends Cubit<AvailableSubjectsState> {
  final AvailableSubjectsRepo _repo;

  AvailableSubjectsCubit(this._repo)
      : super(const AvailableSubjectsState.initial());

  Future<void> fetchAvailableSubjects() async {
    emit(const AvailableSubjectsState.loading());

    final token = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );

    if (token.isEmpty) {
      log('📚 No token found');
      emit(const AvailableSubjectsState.error(
          error: 'No token found'));
      return;
    }

    final response =
        await _repo.getAvailableSubjects(token);

    response.when(
      success: (data) {
        log('📚 Available subjects loaded');
        emit(AvailableSubjectsState.success(data));
      },
      failure: (errorHandler) {
        emit(
          AvailableSubjectsState.error(
            error:
                errorHandler.serverFailure.errmessage,
          ),
        );
      },
    );
  }
}
