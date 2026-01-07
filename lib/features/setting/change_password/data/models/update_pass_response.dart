import 'package:json_annotation/json_annotation.dart';
part 'update_pass_response.g.dart';

@JsonSerializable()
class UpdatePassResponse {
  final String status;
  final String message;
  final String token;

  UpdatePassResponse({
    required this.status,
    required this.message,
    required this.token,
  });

  factory UpdatePassResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdatePassResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdatePassResponseToJson(this);
}
