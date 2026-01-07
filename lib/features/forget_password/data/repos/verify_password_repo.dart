

import 'package:universe/core/networking/api_service.dart';
import 'package:universe/core/networking/server_error_handler.dart';
import 'package:universe/core/networking/server_result.dart';
import '../models/verify_password_model/verify_password_request_body.dart';
import '../models/verify_password_model/verify_password_response.dart';

class VerifyPasswordRepo {
  final ApiService _apiService;

  VerifyPasswordRepo(this._apiService);

  Future<ServerResult<VerifyPasswordResponse>> forget(
      VerifyPasswordRequestBody verifyPasswordRequestBody, String token) async {
    try {
      final response = await _apiService.verifyPassword(
        verifyPasswordRequestBody,
        token,
      );
      return ServerResult.success(response);
    } catch (error) {
      return ServerResult.failure(ServerErrorHandler.handle(error));
    }
  }
}
