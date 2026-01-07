// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_complaint_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddComplaintResponse _$AddComplaintResponseFromJson(
  Map<String, dynamic> json,
) => AddComplaintResponse(
  message: json['message'] as String,
  data: ComplaintData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AddComplaintResponseToJson(
  AddComplaintResponse instance,
) => <String, dynamic>{'message': instance.message, 'data': instance.data};

ComplaintData _$ComplaintDataFromJson(Map<String, dynamic> json) =>
    ComplaintData(
      id: json['_id'] as String,
      subject: json['subject'] as String,
      user: json['user'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$ComplaintDataToJson(ComplaintData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'subject': instance.subject,
      'user': instance.user,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
