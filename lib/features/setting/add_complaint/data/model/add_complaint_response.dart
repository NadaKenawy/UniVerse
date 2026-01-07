import 'package:json_annotation/json_annotation.dart';

part 'add_complaint_response.g.dart';

@JsonSerializable()
class AddComplaintResponse {
  final String message;
  final ComplaintData data;

  AddComplaintResponse({
    required this.message,
    required this.data,
  });

  factory AddComplaintResponse.fromJson(Map<String, dynamic> json) =>
      _$AddComplaintResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddComplaintResponseToJson(this);
}

@JsonSerializable()
class ComplaintData {
  @JsonKey(name: '_id')
  final String id;
  final String subject;
  final String user;
  final String createdAt;
  final String updatedAt;

  ComplaintData({
    required this.id,
    required this.subject,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ComplaintData.fromJson(Map<String, dynamic> json) =>
      _$ComplaintDataFromJson(json);

  Map<String, dynamic> toJson() => _$ComplaintDataToJson(this);
}
