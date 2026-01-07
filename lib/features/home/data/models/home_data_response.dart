// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'home_data_response.g.dart';

@JsonSerializable()
class HomeDataResponse {
  final String status;
  final String currentTerm;
  final HomeData data;

  HomeDataResponse({
    required this.status,
    required this.currentTerm,
    required this.data,
  });

  factory HomeDataResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeDataResponseToJson(this);
}

@JsonSerializable()
class HomeData {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final String? profileImage;
  @JsonKey(name: 'Complete_hours')
  final int completeHours;
  final double GPA;
  final String department;
  final String level;

  HomeData({
    required this.id,
    required this.name,
    this.profileImage,
    required this.completeHours,
    required this.GPA,
    required this.department,
    required this.level,
  });

  factory HomeData.fromJson(Map<String, dynamic> json) =>
      _$HomeDataFromJson(json);

  Map<String, dynamic> toJson() => _$HomeDataToJson(this);
}
