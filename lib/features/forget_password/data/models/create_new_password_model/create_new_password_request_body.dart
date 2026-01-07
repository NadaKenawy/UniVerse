import 'package:json_annotation/json_annotation.dart';

part 'create_new_password_request_body.g.dart';

@JsonSerializable()
class CreateNewPasswordRequestBody {
  final String newPassword;
  final String passwordConfirm;

  CreateNewPasswordRequestBody({
    required this.newPassword,
    required this.passwordConfirm,
  });

  Map<String, dynamic> toJson() => _$CreateNewPasswordRequestBodyToJson(this);

  factory CreateNewPasswordRequestBody.fromJson(Map<String, dynamic> json) =>
      _$CreateNewPasswordRequestBodyFromJson(json);
}
