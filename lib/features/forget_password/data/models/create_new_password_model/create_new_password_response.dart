import 'package:json_annotation/json_annotation.dart';

part 'create_new_password_response.g.dart';

@JsonSerializable()
class CreateNewPasswordResponse {
  final String? token;

  CreateNewPasswordResponse({
    this.token,
  });

  factory CreateNewPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateNewPasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateNewPasswordResponseToJson(this);
}
