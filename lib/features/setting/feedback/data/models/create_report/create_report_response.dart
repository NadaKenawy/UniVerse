import 'package:json_annotation/json_annotation.dart';
part 'create_report_response.g.dart';

@JsonSerializable()
class CreateReportResponse {
  final ReviewData data;
  final String message;

  CreateReportResponse({required this.data, required this.message});

  factory CreateReportResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateReportResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateReportResponseToJson(this);
}

@JsonSerializable()
class ReviewData {
  @JsonKey(name: '_id')
  final String id;
  final String title;
  final double ratings;
  final String user; 
  final String createdAt;
  final String updatedAt;
  @JsonKey(name: '__v')
  final int v;

  ReviewData({
    required this.id,
    required this.title,
    required this.ratings,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory ReviewData.fromJson(Map<String, dynamic> json) =>
      _$ReviewDataFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewDataToJson(this);
}
