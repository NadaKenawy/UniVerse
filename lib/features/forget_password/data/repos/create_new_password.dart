

import 'package:universe/core/networking/api_service.dart';
import 'package:universe/core/networking/server_error_handler.dart';
import 'package:universe/core/networking/server_result.dart';

import '../models/create_new_password_model/create_new_password_request_body.dart';

class CreateNewPasswordRepo {
  final ApiService _apiService;

  CreateNewPasswordRepo(this._apiService);
  Future<ServerResult<void>> createNewPassword(
    CreateNewPasswordRequestBody createNewPasswordRequestBody,
    String token,
  ) async {
    try {
      await _apiService.createNewPassword(token, createNewPasswordRequestBody);
      return const ServerResult.success(null); 
    } catch (error) {
      return ServerResult.failure(ServerErrorHandler.handle(error));
    }
  }
}
