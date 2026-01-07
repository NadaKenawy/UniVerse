import 'package:json_annotation/json_annotation.dart';

part 'register_subject_request.g.dart';

@JsonSerializable()
class RegisterSubjectRequest {
  @JsonKey(name: 'course')
  final String courseId;

  @JsonKey(name: 'section')
  final String sectionId;

  RegisterSubjectRequest({
    required this.courseId,
    required this.sectionId,
  });

  factory RegisterSubjectRequest.fromJson(
          Map<String, dynamic> json) =>
      _$RegisterSubjectRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RegisterSubjectRequestToJson(this);
}
