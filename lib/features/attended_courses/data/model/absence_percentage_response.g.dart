// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'absence_percentage_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AbsencePercentageResponse _$AbsencePercentageResponseFromJson(
  Map<String, dynamic> json,
) => AbsencePercentageResponse(
  status: json['status'] as String,
  count: (json['count'] as num).toInt(),
  type: json['type'] as String?,
  data: (json['data'] as List<dynamic>)
      .map((e) => AbsenceCourseData.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AbsencePercentageResponseToJson(
  AbsencePercentageResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'count': instance.count,
  'type': instance.type,
  'data': instance.data,
};

AbsenceCourseData _$AbsenceCourseDataFromJson(Map<String, dynamic> json) =>
    AbsenceCourseData(
      courseId: json['courseId'] as String,
      courseName: json['courseName'] as String,
      professorName: json['professorName'] as String,
      professorImage: json['professorImage'] as String,
      totalLectures: (json['totalLectures'] as num).toInt(),
      attendedLectures: (json['attendedLectures'] as num).toInt(),
      absentLectures: (json['absentLectures'] as num).toInt(),
      absencePercentage: (json['absencePercentage'] as num).toDouble(),
    );

Map<String, dynamic> _$AbsenceCourseDataToJson(AbsenceCourseData instance) =>
    <String, dynamic>{
      'courseId': instance.courseId,
      'courseName': instance.courseName,
      'professorName': instance.professorName,
      'professorImage': instance.professorImage,
      'totalLectures': instance.totalLectures,
      'attendedLectures': instance.attendedLectures,
      'absentLectures': instance.absentLectures,
      'absencePercentage': instance.absencePercentage,
    };
