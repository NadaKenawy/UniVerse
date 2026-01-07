
import 'package:universe/core/networking/server_error_handler.dart';
import 'package:universe/core/networking/server_result.dart';
import 'package:universe/features/setting/feedback/data/models/update_report/update_report_response.dart';

import '../../../../../core/networking/api_service.dart';
import '../models/update_report/update_report_request_body.dart';

class UpdateReportRepo {
  final ApiService _apiService;
  UpdateReportRepo(this._apiService);

  Future<ServerResult<UpdateReportResponse>> updateReport(
    UpdateReportRequestBody updateReportRequestBody,
    String token,
  ) async {
    try {
      final response = await _apiService.updateReport(
        token,
        updateReportRequestBody,
      );
      return ServerResult.success(response);
    } catch (error) {
      return ServerResult.failure(ServerErrorHandler.handle(error));
    }
  }
}
