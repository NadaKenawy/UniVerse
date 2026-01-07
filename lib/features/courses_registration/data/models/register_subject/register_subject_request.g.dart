// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_subject_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterSubjectRequest _$RegisterSubjectRequestFromJson(
  Map<String, dynamic> json,
) => RegisterSubjectRequest(
  courseId: json['course'] as String,
  sectionId: json['section'] as String,
);

Map<String, dynamic> _$RegisterSubjectRequestToJson(
  RegisterSubjectRequest instance,
) => <String, dynamic>{
  'course': instance.courseId,
  'section': instance.sectionId,
};
