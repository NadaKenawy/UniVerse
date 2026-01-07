import 'package:json_annotation/json_annotation.dart';
part 'update_pass_request_body.g.dart';

@JsonSerializable()
class UpdatePassRequestBody {
  final String oldPassword;
  final String newPassword;
  final String passwordConfirm;

  UpdatePassRequestBody({
    required this.oldPassword,
    required this.newPassword,
    required this.passwordConfirm,
  });

  factory UpdatePassRequestBody.fromJson(Map<String, dynamic> json) =>
      _$UpdatePassRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$UpdatePassRequestBodyToJson(this);
}
