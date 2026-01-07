import 'package:json_annotation/json_annotation.dart';

part 'add_complaint_request_body.g.dart';

@JsonSerializable()
class AddComplaintRequestBody {
  final String subject;

  AddComplaintRequestBody({
    required this.subject,
  });

  factory AddComplaintRequestBody.fromJson(Map<String, dynamic> json) =>
      _$AddComplaintRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$AddComplaintRequestBodyToJson(this);
}
