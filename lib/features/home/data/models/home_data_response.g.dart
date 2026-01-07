// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDataResponse _$HomeDataResponseFromJson(Map<String, dynamic> json) =>
    HomeDataResponse(
      status: json['status'] as String,
      currentTerm: json['currentTerm'] as String,
      data: HomeData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeDataResponseToJson(HomeDataResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'currentTerm': instance.currentTerm,
      'data': instance.data,
    };

HomeData _$HomeDataFromJson(Map<String, dynamic> json) => HomeData(
  id: json['_id'] as String,
  name: json['name'] as String,
  profileImage: json['profileImage'] as String?,
  completeHours: (json['Complete_hours'] as num).toInt(),
  GPA: (json['GPA'] as num).toDouble(),
  department: json['department'] as String,
  level: json['level'] as String,
);

Map<String, dynamic> _$HomeDataToJson(HomeData instance) => <String, dynamic>{
  '_id': instance.id,
  'name': instance.name,
  'profileImage': instance.profileImage,
  'Complete_hours': instance.completeHours,
  'GPA': instance.GPA,
  'department': instance.department,
  'level': instance.level,
};
