import 'package:json_annotation/json_annotation.dart';

part 'forget_pass_response.g.dart';

@JsonSerializable()
class ForgetPassResponse {
  final String? status;
  final String? message;
  final String? token;

  ForgetPassResponse({this.status, this.message, this.token});

  factory ForgetPassResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgetPassResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPassResponseToJson(this);
}
