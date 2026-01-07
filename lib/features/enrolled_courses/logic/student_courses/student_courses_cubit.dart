import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universe/core/constants/shared_pref_helper.dart';
import 'package:universe/core/constants/shared_pref_keys.dart';
import 'package:universe/core/networking/server_result.dart';
import 'package:universe/features/enrolled_courses/data/repos/student_courses_repo.dart';
import 'student_courses_state.dart';

class StudentCoursesCubit extends Cubit<StudentCoursesState> {
  final StudentCoursesRepo _repo;

  StudentCoursesCubit(this._repo) : super(const StudentCoursesState.initial());

  Future<void> fetchStudentCourses({String? level, String? type}) async {
    emit(const StudentCoursesState.loading());

    final token = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );

    if (token.isEmpty) {
      emit(const StudentCoursesState.error(error: 'No token found'));
      return;
    }

    final response = await _repo.getStudentCourses(
      token: token,
      level: level,
      type: type,
    );

    response.when(
      success: (data) {
        log('📚 Student courses loaded');
        emit(StudentCoursesState.success(data));
      },
      failure: (errorHandler) {
        emit(
          StudentCoursesState.error(
            error: errorHandler.serverFailure.errmessage,
          ),
        );
      },
    );
  }
}
