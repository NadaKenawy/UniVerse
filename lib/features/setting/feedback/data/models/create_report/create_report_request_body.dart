import 'package:json_annotation/json_annotation.dart';
part 'create_report_request_body.g.dart';

@JsonSerializable()
class CreateReportRequestBody {
  final String? title;
  final double ratings;

  CreateReportRequestBody({this.title, required this.ratings});

  factory CreateReportRequestBody.fromJson(Map<String, dynamic> json) =>
      _$CreateReportRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$CreateReportRequestBodyToJson(this);
}
