import 'package:json_annotation/json_annotation.dart';

part 'chat_bot_request_body.g.dart';

@JsonSerializable()
class ChatRequestBody {
  final String message;

  ChatRequestBody({required this.message});

  factory ChatRequestBody.fromJson(Map<String, dynamic> json) =>
      _$ChatRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$ChatRequestBodyToJson(this);
}
