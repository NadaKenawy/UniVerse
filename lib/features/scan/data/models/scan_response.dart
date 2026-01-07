import 'package:json_annotation/json_annotation.dart';

part 'scan_response.g.dart';

@JsonSerializable()
class ScanResponse {
  final String message;

  ScanResponse({required this.message});

  factory ScanResponse.fromJson(Map<String, dynamic> json) =>
      _$ScanResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ScanResponseToJson(this);
}
