import 'package:universe/features/attended_courses/data/model/absence_percentage_response.dart';
import '../../../../core/networking/api_service.dart';
import '../../../../core/networking/server_error_handler.dart';
import '../../../../core/networking/server_result.dart';
class AbsenceRepo {
  final ApiService _apiService;

  AbsenceRepo(this._apiService);

  Future<ServerResult<AbsencePercentageResponse>>
      getAbsencePercentage({
    required String token,
    required String type,
  }) async {
    try {
      final response =
          await _apiService.getAbsencePercentage(
        token: token,
        type: type,
      );
      return ServerResult.success(response);
    } catch (error) {
      return ServerResult.failure(
        ServerErrorHandler.handle(error),
      );
    }
  }
}
