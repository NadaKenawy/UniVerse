import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universe/core/networking/server_result.dart';
import 'package:universe/features/chat_bot/data/repo/chat_bot_repo.dart';
import 'package:universe/features/chat_bot/logic/chat_bot_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepo _chatRepo;

  ChatCubit(this._chatRepo) : super(const ChatState.initial());

  Future<void> sendMessage({
    required String message,
  }) async {
    emit(const ChatState.loading());

    if (message.trim().isEmpty) {
      log('🤖 Empty message');
      emit(
        ChatState.error(
          error: 'Message cannot be empty',
        ),
      );
      return;
    }

    final response = await _chatRepo.sendMessage(
      message: message,
    );

    response.when(
      success: (data) {
        log('🤖 Chat response received');
        emit(ChatState.success(data));
      },
      failure: (errorHandler) {
        emit(
          ChatState.error(
            error: errorHandler.serverFailure.errmessage,
          ),
        );
      },
    );
  }
}
