import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:universe/features/enrolled_courses/data/models/course_details/course_details_response.dart';

part 'course_details_state.freezed.dart';

@freezed
class CourseDetailsState with _$CourseDetailsState {
  const factory CourseDetailsState.initial() = _Initial;
  const factory CourseDetailsState.loading() = _Loading;
  const factory CourseDetailsState.success(CourseDetailsResponse data) =
      _Success;
  const factory CourseDetailsState.error({required String error}) = _Error;
}
