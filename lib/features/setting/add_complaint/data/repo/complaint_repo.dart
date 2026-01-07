import 'package:universe/core/networking/server_error_handler.dart';
import 'package:universe/core/networking/server_result.dart';
import 'package:universe/features/setting/add_complaint/data/model/add_complaint_request_body.dart';
import 'package:universe/features/setting/add_complaint/data/model/add_complaint_response.dart';

import '../../../../../core/networking/api_service.dart';

class ComplaintRepo {
  final ApiService _apiService;

  ComplaintRepo(this._apiService);

  Future<ServerResult<AddComplaintResponse>> addComplaint(
    AddComplaintRequestBody requestBody,
    String token,
  ) async {
    try {
      final response = await _apiService.addComplaint(
        token,
        requestBody,
      );
      return ServerResult.success(response);
    } catch (error) {
      return ServerResult.failure(
        ServerErrorHandler.handle(error),
      );
    }
  }
}
