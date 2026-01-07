import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:universe/features/enrolled_courses/data/models/student_courses/student_courses_response.dart';

part 'student_courses_state.freezed.dart';

@freezed
class StudentCoursesState with _$StudentCoursesState {
  const factory StudentCoursesState.initial() = _Initial;
  const factory StudentCoursesState.loading() = _Loading;
  const factory StudentCoursesState.success(StudentCoursesResponse data) =
      _Success;
  const factory StudentCoursesState.error({required String error}) = _Error;
}
