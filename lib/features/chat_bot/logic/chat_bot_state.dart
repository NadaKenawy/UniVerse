import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:universe/features/chat_bot/data/model/chat_bot_response.dart';
part 'chat_bot_state.freezed.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState.initial() = Initial;
  const factory ChatState.loading() = Loading;
  const factory ChatState.success(ChatResponse response) = Success;
  const factory ChatState.error({required String error}) = Error;
}
