// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleResponse _$ScheduleResponseFromJson(Map<String, dynamic> json) =>
    ScheduleResponse(
      status: json['status'] as String,
      count: (json['count'] as num).toInt(),
      day: json['day'] as String?,
      courses: (json['courses'] as List<dynamic>)
          .map((e) => ScheduleCourse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ScheduleResponseToJson(ScheduleResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'count': instance.count,
      'day': instance.day,
      'courses': instance.courses,
    };

ScheduleCourse _$ScheduleCourseFromJson(Map<String, dynamic> json) =>
    ScheduleCourse(
      courseId: json['courseId'] as String,
      courseName: json['courseName'] as String,
      type: json['type'] as String,
      instructor: Instructor.fromJson(
        json['instructor'] as Map<String, dynamic>,
      ),
      day: json['day'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      location: json['location'] as String,
    );

Map<String, dynamic> _$ScheduleCourseToJson(ScheduleCourse instance) =>
    <String, dynamic>{
      'courseId': instance.courseId,
      'courseName': instance.courseName,
      'type': instance.type,
      'instructor': instance.instructor,
      'day': instance.day,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'location': instance.location,
    };

Instructor _$InstructorFromJson(Map<String, dynamic> json) =>
    Instructor(name: json['name'] as String, image: json['image'] as String);

Map<String, dynamic> _$InstructorToJson(Instructor instance) =>
    <String, dynamic>{'name': instance.name, 'image': instance.image};
