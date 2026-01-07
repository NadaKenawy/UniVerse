import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universe/core/constants/shared_pref_helper.dart';
import 'package:universe/core/constants/shared_pref_keys.dart';
import 'package:universe/core/networking/server_result.dart';
import 'package:universe/features/enrolled_courses/data/repos/course_details_repo.dart';
import 'course_details_state.dart';

class CourseDetailsCubit extends Cubit<CourseDetailsState> {
  final CourseDetailsRepo _repo;

  CourseDetailsCubit(this._repo)
      : super(const CourseDetailsState.initial());

  Future<void> fetchCourseDetails(String courseId) async {
    emit(const CourseDetailsState.loading());

    final token = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );

    if (token.isEmpty) {
      emit(const CourseDetailsState.error(
        error: 'No token found',
      ));
      return;
    }

    final response =
        await _repo.getCourseDetails(token, courseId);

    response.when(
      success: (data) {
        log('📘 Course details loaded');
        emit(CourseDetailsState.success(data));
      },
      failure: (errorHandler) {
        emit(
          CourseDetailsState.error(
            error:
                errorHandler.serverFailure.errmessage,
          ),
        );
      },
    );
  }
}
