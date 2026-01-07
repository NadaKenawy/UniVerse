import 'package:universe/features/chat_bot/data/model/chat_bot_request_body.dart';
import 'package:universe/features/chat_bot/data/model/chat_bot_response.dart';

import '../../../../core/networking/api_service.dart';
import '../../../../core/networking/server_error_handler.dart';
import '../../../../core/networking/server_result.dart';

class ChatRepo {
  final ApiService _apiService;

  ChatRepo(this._apiService);

  Future<ServerResult<ChatResponse>> sendMessage({
    required String message,
  }) async {
    try {
      final response = await _apiService.sendChatMessage(
        ChatRequestBody(message: message),
        'application/json',
      );

      final chatResponse = ChatResponse.fromJson(
        response as Map<String, dynamic>,
      );

      return ServerResult.success(chatResponse);
    } catch (error) {
      return ServerResult.failure(ServerErrorHandler.handle(error));
    }
  }
}
