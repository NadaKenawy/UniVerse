
import 'package:universe/core/networking/server_error_handler.dart';
import 'package:universe/core/networking/server_result.dart';

import '../../../../../core/networking/api_service.dart';
import '../models/update_pass_request_body.dart';
import '../models/update_pass_response.dart';

class UpdatePassRepo {
  final ApiService _apiService;

  UpdatePassRepo(this._apiService);

  Future<ServerResult<UpdatePassResponse>> updatePassword(
    UpdatePassRequestBody updatePassRequestBody,
    String token,
  ) async {
    try {
      final response = await _apiService.updatePassword(
        token,
        updatePassRequestBody,
      );
      return ServerResult.success(response);
    } catch (error) {
      return ServerResult.failure(ServerErrorHandler.handle(error));
    }
  }
}
