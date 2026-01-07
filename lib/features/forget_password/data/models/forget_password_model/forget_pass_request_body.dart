import 'package:json_annotation/json_annotation.dart';

part 'forget_pass_request_body.g.dart';

@JsonSerializable()
class ForgetPassRequestBody {
  @JsonKey(name: 'email') 
  final String email;

  ForgetPassRequestBody({required this.email});

  Map<String, dynamic> toJson() => _$ForgetPassRequestBodyToJson(this);

  factory ForgetPassRequestBody.fromJson(Map<String, dynamic> json) =>
      _$ForgetPassRequestBodyFromJson(json);
}
