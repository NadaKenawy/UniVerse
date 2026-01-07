import 'package:universe/core/networking/api_service.dart';
import 'package:universe/core/networking/server_error_handler.dart';
import 'package:universe/core/networking/server_result.dart';
import 'package:universe/features/enrolled_courses/data/models/student_courses/student_courses_response.dart';

class StudentCoursesRepo {
  final ApiService _apiService;

  StudentCoursesRepo(this._apiService);

  Future<ServerResult<StudentCoursesResponse>> getStudentCourses({
    required String token,
    String? level,
    String? type,
  }) async {
    try {
      final response = await _apiService.getStudentCourses(
        token,
        level,
        type,
      );

      return ServerResult.success(response);
    } catch (error) {
      return ServerResult.failure(
        ServerErrorHandler.handle(error),
      );
    }
  }
}
