import 'package:json_annotation/json_annotation.dart';
part 'update_report_request_body.g.dart';

@JsonSerializable()
class UpdateReportRequestBody {
  final String title;
  final double ratings;
  final String userId;

  UpdateReportRequestBody({
    required this.title,
    required this.ratings,
    required this.userId,
  });

  Map<String, dynamic> toJson() => {
    'title': title,
    'ratings': ratings,
    'user': userId,
  };
}
