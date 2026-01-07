import 'package:json_annotation/json_annotation.dart';

part 'get_reports_response.g.dart';

@JsonSerializable()
class ReportsResponse {
  final String status;
  final ReportsFilter filter;
  final List<ReportItem> reports;
  final ReportsStats stats;

  ReportsResponse({
    required this.status,
    required this.filter,
    required this.reports,
    required this.stats,
  });

  factory ReportsResponse.fromJson(Map<String, dynamic> json) =>
      _$ReportsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReportsResponseToJson(this);
}

@JsonSerializable()
class ReportsFilter {
  final String type;

  ReportsFilter({required this.type});

  factory ReportsFilter.fromJson(Map<String, dynamic> json) =>
      _$ReportsFilterFromJson(json);

  Map<String, dynamic> toJson() => _$ReportsFilterToJson(this);
}

@JsonSerializable()
class ReportItem {
  @JsonKey(name: '_id')
  final String id;
  final String title;
  final ReportUser user;
  final String type;
  final int ratings;
  final String createdAt;
  final String updatedAt;

  ReportItem({
    required this.id,
    required this.title,
    required this.user,
    required this.type,
    required this.ratings,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ReportItem.fromJson(Map<String, dynamic> json) =>
      _$ReportItemFromJson(json);

  Map<String, dynamic> toJson() => _$ReportItemToJson(this);
}

@JsonSerializable()
class ReportUser {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final String profileImage;

  ReportUser({
    required this.id,
    required this.name,
    required this.profileImage,
  });

  factory ReportUser.fromJson(Map<String, dynamic> json) =>
      _$ReportUserFromJson(json);

  Map<String, dynamic> toJson() => _$ReportUserToJson(this);
}

@JsonSerializable()
class ReportsStats {
  @JsonKey(fromJson: _doubleFromJson)
  final double averageRating;
  final String percentage;
  @JsonKey(fromJson: _intFromJson)
  final int totalReports;

  ReportsStats({
    required this.averageRating,
    required this.percentage,
    required this.totalReports,
  });

  factory ReportsStats.fromJson(Map<String, dynamic> json) =>
      _$ReportsStatsFromJson(json);

  Map<String, dynamic> toJson() => _$ReportsStatsToJson(this);

  static double _doubleFromJson(dynamic value) {
    if (value is num) {
      return value.toDouble();
    } else if (value is String) {
      return double.tryParse(value) ?? 0.0;
    }
    return 0.0;
  }

  static int _intFromJson(dynamic value) {
    if (value is num) {
      return value.toInt();
    } else if (value is String) {
      return int.tryParse(value) ?? 0;
    }
    return 0;
  }
}
