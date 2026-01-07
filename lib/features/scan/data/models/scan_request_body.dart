import 'package:json_annotation/json_annotation.dart';

part 'scan_request_body.g.dart';

@JsonSerializable()
class ScanRequestBody {
  final String qrCodeId;

  ScanRequestBody({required this.qrCodeId});

  factory ScanRequestBody.fromJson(Map<String, dynamic> json) =>
      _$ScanRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$ScanRequestBodyToJson(this);
}
