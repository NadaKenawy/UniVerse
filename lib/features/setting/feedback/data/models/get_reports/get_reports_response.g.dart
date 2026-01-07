// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_reports_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportsResponse _$ReportsResponseFromJson(Map<String, dynamic> json) =>
    ReportsResponse(
      status: json['status'] as String,
      filter: ReportsFilter.fromJson(json['filter'] as Map<String, dynamic>),
      reports: (json['reports'] as List<dynamic>)
          .map((e) => ReportItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      stats: ReportsStats.fromJson(json['stats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReportsResponseToJson(ReportsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'filter': instance.filter,
      'reports': instance.reports,
      'stats': instance.stats,
    };

ReportsFilter _$ReportsFilterFromJson(Map<String, dynamic> json) =>
    ReportsFilter(type: json['type'] as String);

Map<String, dynamic> _$ReportsFilterToJson(ReportsFilter instance) =>
    <String, dynamic>{'type': instance.type};

ReportItem _$ReportItemFromJson(Map<String, dynamic> json) => ReportItem(
  id: json['_id'] as String,
  title: json['title'] as String,
  user: ReportUser.fromJson(json['user'] as Map<String, dynamic>),
  type: json['type'] as String,
  ratings: (json['ratings'] as num).toInt(),
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
);

Map<String, dynamic> _$ReportItemToJson(ReportItem instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'user': instance.user,
      'type': instance.type,
      'ratings': instance.ratings,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

ReportUser _$ReportUserFromJson(Map<String, dynamic> json) => ReportUser(
  id: json['_id'] as String,
  name: json['name'] as String,
  profileImage: json['profileImage'] as String,
);

Map<String, dynamic> _$ReportUserToJson(ReportUser instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'profileImage': instance.profileImage,
    };

ReportsStats _$ReportsStatsFromJson(Map<String, dynamic> json) => ReportsStats(
  averageRating: ReportsStats._doubleFromJson(json['averageRating']),
  percentage: json['percentage'] as String,
  totalReports: ReportsStats._intFromJson(json['totalReports']),
);

Map<String, dynamic> _$ReportsStatsToJson(ReportsStats instance) =>
    <String, dynamic>{
      'averageRating': instance.averageRating,
      'percentage': instance.percentage,
      'totalReports': instance.totalReports,
    };
