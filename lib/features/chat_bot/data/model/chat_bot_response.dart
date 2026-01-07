import 'package:json_annotation/json_annotation.dart';

part 'chat_bot_response.g.dart';

@JsonSerializable()
class ChatResponse {
  final String answer;

  ChatResponse({required this.answer});

  factory ChatResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChatResponseToJson(this);
}
