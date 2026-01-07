import 'package:universe/features/courses_registration/data/models/available_subjects/available_subjects_response.dart';
import '../../../../core/networking/api_service.dart';
import '../../../../core/networking/server_error_handler.dart';
import '../../../../core/networking/server_result.dart';

class AvailableSubjectsRepo {
  final ApiService _apiService;

  AvailableSubjectsRepo(this._apiService);

  Future<ServerResult<AvailableSubjectsResponse>>
      getAvailableSubjects(String token) async {
    try {
      final response =
          await _apiService.getAvailableSubjects(token);
      return ServerResult.success(response);
    } catch (error) {
      return ServerResult.failure(
        ServerErrorHandler.handle(error),
      );
    }
  }
}
