// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'update_report_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateReportRequestBody _$UpdateReportRequestBodyFromJson(
  Map<String, dynamic> json,
) => UpdateReportRequestBody(
  title: json['title'] as String,
  ratings: (json['ratings'] as num).toDouble(),
  userId: json['userId'] as String,
);

Map<String, dynamic> _$UpdateReportRequestBodyToJson(
  UpdateReportRequestBody instance,
) => <String, dynamic>{
  'title': instance.title,
  'ratings': instance.ratings,
  'userId': instance.userId,
};
