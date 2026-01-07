import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universe/core/constants/shared_pref_helper.dart';
import 'package:universe/core/constants/shared_pref_keys.dart';
import 'package:universe/core/networking/server_result.dart';
import 'package:universe/features/courses_registration/data/models/register_subject/register_subject_request.dart';
import 'package:universe/features/courses_registration/data/repos/register_subject_repo.dart';
import 'register_subject_state.dart';

class RegisterSubjectCubit extends Cubit<RegisterSubjectState> {
  final RegisterSubjectRepo _repo;

  RegisterSubjectCubit(this._repo)
    : super(const RegisterSubjectState.initial());

  Future<void> registerSubject({
    required String courseId,
    required String sectionId,
  }) async {
    emit(const RegisterSubjectState.loading());

    final token = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );

    if (token.isEmpty) {
      emit(const RegisterSubjectState.error(error: 'No token found'));
      return;
    }

    final request = RegisterSubjectRequest(
      courseId: courseId,
      sectionId: sectionId,
    );

    final response = await _repo.registerSubject(
      token: token,
      request: request,
    );

    response.when(
      success: (data) {
        emit(RegisterSubjectState.success(data));
      },
      failure: (errorHandler) {
        emit(
          RegisterSubjectState.error(
            error: errorHandler.serverFailure.errmessage,
          ),
        );
      },
    );
  }
}
