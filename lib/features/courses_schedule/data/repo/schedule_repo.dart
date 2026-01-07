import 'package:universe/features/courses_schedule/data/model/schedule_response.dart';

import '../../../../core/networking/api_service.dart';
import '../../../../core/networking/server_error_handler.dart';
import '../../../../core/networking/server_result.dart';

class ScheduleRepo {
  final ApiService _apiService;

  ScheduleRepo(this._apiService);

  Future<ServerResult<ScheduleResponse>> getStudentSchedule({
    required String token,
    String? day,
  }) async {
    try {
      final response = await _apiService.getStudentSchedule(
        token: token,
        day: day,
      );
      return ServerResult.success(response);
    } catch (error) {
      return ServerResult.failure(
        ServerErrorHandler.handle(error),
      );
    }
  }
}
