import 'package:json_annotation/json_annotation.dart';

part 'register_subject_response.g.dart';

@JsonSerializable()
class RegisterSubjectResponse {
  final String status;
  final String message;

  RegisterSubjectResponse({
    required this.status,
    required this.message,
  });

  factory RegisterSubjectResponse.fromJson(
          Map<String, dynamic> json) =>
      _$RegisterSubjectResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RegisterSubjectResponseToJson(this);
}
