import 'package:universe/core/networking/server_error_handler.dart';
import 'package:universe/core/networking/server_result.dart';
import '../../../../../core/networking/api_service.dart';
import '../models/create_report/create_report_request_body.dart';
import '../models/create_report/create_report_response.dart';

class CreateReportRepo {
  final ApiService _apiService;

  CreateReportRepo(this._apiService);

  Future<ServerResult<CreateReportResponse>> createReport(
    CreateReportRequestBody createReportRequestBody,
    String token,
  ) async {
    try {
      final response = await _apiService.createReport(
        token,
        createReportRequestBody,
      );
      return ServerResult.success(response);
    } catch (error) {
      return ServerResult.failure(ServerErrorHandler.handle(error));
    }
  }
}
