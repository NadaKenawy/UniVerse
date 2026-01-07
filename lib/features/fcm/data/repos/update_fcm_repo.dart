

import 'package:universe/core/networking/api_service.dart';
import 'package:universe/core/networking/server_error_handler.dart';
import 'package:universe/core/networking/server_result.dart';
import 'package:universe/features/fcm/data/models/update_fcm/update_fcm_response.dart';
import 'package:universe/features/fcm/data/models/update_fcm/update_fcm_token_request_body.dart';

class UpdateFcmRepo {
  final ApiService _apiService;

  UpdateFcmRepo(this._apiService);

  Future<ServerResult<UpdateFcmResponse>> updateFcm(
    String authToken,
    String fcmToken,
  ) async {
    try {
      final requestBody = UpdateFcmTokenRequestBody(token: fcmToken);
      final response = await _apiService.updateFcm(
        authToken,
        requestBody,
      );

      return ServerResult.success(response);
    } catch (error) {
      return ServerResult.failure(ServerErrorHandler.handle(error));
    }
  }
}
