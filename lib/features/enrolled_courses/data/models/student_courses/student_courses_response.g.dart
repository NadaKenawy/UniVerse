// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_courses_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentCoursesResponse _$StudentCoursesResponseFromJson(
  Map<String, dynamic> json,
) => StudentCoursesResponse(
  status: json['status'] as String,
  count: (json['count'] as num).toInt(),
  filters: json['filters'] == null
      ? null
      : CoursesFilters.fromJson(json['filters'] as Map<String, dynamic>),
  courses: (json['courses'] as List<dynamic>?)
      ?.map((e) => StudentCourseItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$StudentCoursesResponseToJson(
  StudentCoursesResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'count': instance.count,
  'filters': instance.filters,
  'courses': instance.courses,
};

CoursesFilters _$CoursesFiltersFromJson(Map<String, dynamic> json) =>
    CoursesFilters(
      level: json['level'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$CoursesFiltersToJson(CoursesFilters instance) =>
    <String, dynamic>{'level': instance.level, 'type': instance.type};

StudentCourseItem _$StudentCourseItemFromJson(Map<String, dynamic> json) =>
    StudentCourseItem(
      id: json['_id'] as String,
      status: json['status'] as String?,
      type: json['type'] as String,
      level: json['level'] as String,
      course: CourseBrief.fromJson(json['course'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StudentCourseItemToJson(StudentCourseItem instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'status': instance.status,
      'type': instance.type,
      'level': instance.level,
      'course': instance.course,
    };

CourseBrief _$CourseBriefFromJson(Map<String, dynamic> json) => CourseBrief(
  id: json['_id'] as String,
  name: json['name'] as String,
  hours: (json['hours'] as num).toInt(),
  location: json['location'] as String,
  professor: CourseProfessor.fromJson(
    json['professor'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$CourseBriefToJson(CourseBrief instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'hours': instance.hours,
      'location': instance.location,
      'professor': instance.professor,
    };

CourseProfessor _$CourseProfessorFromJson(Map<String, dynamic> json) =>
    CourseProfessor(
      id: json['_id'] as String,
      name: json['name'] as String,
      profileImage: json['profileImage'] as String,
    );

Map<String, dynamic> _$CourseProfessorToJson(CourseProfessor instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'profileImage': instance.profileImage,
    };
