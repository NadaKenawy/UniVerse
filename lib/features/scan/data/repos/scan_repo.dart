import 'package:universe/core/networking/server_error_handler.dart';
import 'package:universe/core/networking/server_result.dart';
import 'package:universe/features/scan/data/models/scan_request_body.dart';
import 'package:universe/features/scan/data/models/scan_response.dart';
import '../../../../core/networking/api_service.dart';

class ScanRepo {
  final ApiService _apiService;

  ScanRepo(this._apiService);

  Future<ServerResult<ScanResponse>> scan(
    ScanRequestBody scanRequestBody,
    String token,
  ) async {
    try {
      final response = await _apiService.scan(scanRequestBody, token);
      return ServerResult.success(response);
    } catch (error) {
      return ServerResult.failure(ServerErrorHandler.handle(error));
    }
  }
}
