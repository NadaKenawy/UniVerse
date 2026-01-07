import 'package:json_annotation/json_annotation.dart';

part 'update_fcm_token_request_body.g.dart';

@JsonSerializable()
class UpdateFcmTokenRequestBody {
  @JsonKey(name: 'token')
  final String token;

  UpdateFcmTokenRequestBody({required this.token});

  Map<String, dynamic> toJson() => _$UpdateFcmTokenRequestBodyToJson(this);
}
