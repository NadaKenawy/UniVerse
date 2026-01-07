// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_notifications_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllNotificationsResponse _$GetAllNotificationsResponseFromJson(
  Map<String, dynamic> json,
) => GetAllNotificationsResponse(
  status: json['status'] as String?,
  message: json['message'] as String?,
  notifications: (json['data'] as List<dynamic>?)
      ?.map((e) => NotificationData.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GetAllNotificationsResponseToJson(
  GetAllNotificationsResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.notifications,
};

NotificationData _$NotificationDataFromJson(Map<String, dynamic> json) =>
    NotificationData(
      id: json['_id'] as String,
      user: json['user'] as String,
      title: json['title'] as String,
      subject: json['subject'] as String,
      isRead: json['isRead'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$NotificationDataToJson(NotificationData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user': instance.user,
      'title': instance.title,
      'subject': instance.subject,
      'isRead': instance.isRead,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
