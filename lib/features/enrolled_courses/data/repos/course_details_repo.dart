import 'package:universe/core/networking/api_service.dart';
import 'package:universe/core/networking/server_error_handler.dart';
import 'package:universe/core/networking/server_result.dart';
import 'package:universe/features/enrolled_courses/data/models/course_details/course_details_response.dart';

class CourseDetailsRepo {
  final ApiService _apiService;

  CourseDetailsRepo(this._apiService);

  Future<ServerResult<CourseDetailsResponse>> getCourseDetails(
    String token,
    String courseId,
  ) async {
    try {
      final response =
          await _apiService.getCourseDetails(token, courseId);

      return ServerResult.success(response);
    } catch (error) {
      return ServerResult.failure(
        ServerErrorHandler.handle(error),
      );
    }
  }
}
