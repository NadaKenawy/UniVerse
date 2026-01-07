import 'package:json_annotation/json_annotation.dart';

part 'update_fcm_response.g.dart';

@JsonSerializable()
class UpdateFcmResponse {
  @JsonKey(name: 'message')
  final String? message;

  UpdateFcmResponse({this.message});

  factory UpdateFcmResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateFcmResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateFcmResponseToJson(this);
}
