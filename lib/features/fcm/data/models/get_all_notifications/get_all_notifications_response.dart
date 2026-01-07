import 'package:json_annotation/json_annotation.dart';

part 'get_all_notifications_response.g.dart';

@JsonSerializable()
class GetAllNotificationsResponse {
  final String? status;
  final String? message;
  @JsonKey(name: 'data')
  final List<NotificationData>? notifications;

  GetAllNotificationsResponse({
    this.status,
    this.message,
    this.notifications,
  });

  factory GetAllNotificationsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllNotificationsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllNotificationsResponseToJson(this);
}

@JsonSerializable()
class NotificationData {
  @JsonKey(name: '_id')
  final String id;
  final String user;
  final String title;
  final String subject;
  final bool isRead;
  final DateTime createdAt;
  final DateTime updatedAt;

  NotificationData({
    required this.id,
    required this.user,
    required this.title,
    required this.subject,
    required this.isRead,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationDataToJson(this);
}
