import 'package:json_annotation/json_annotation.dart';

part 'schedule_response.g.dart';

@JsonSerializable()
class ScheduleResponse {
  final String status;
  final int count;
  final String? day;
  final List<ScheduleCourse> courses;

  ScheduleResponse({
    required this.status,
    required this.count,
    this.day,
    required this.courses,
  });

  factory ScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$ScheduleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleResponseToJson(this);
}

@JsonSerializable()
class ScheduleCourse {
  final String courseId;
  final String courseName;
  final String type;
  final Instructor instructor;
  final String day;
  final String startTime;
  final String endTime;
  final String location;

  ScheduleCourse({
    required this.courseId,
    required this.courseName,
    required this.type,
    required this.instructor,
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.location,
  });

  factory ScheduleCourse.fromJson(Map<String, dynamic> json) =>
      _$ScheduleCourseFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleCourseToJson(this);
}

@JsonSerializable()
class Instructor {
  final String name;
  final String image;

  Instructor({
    required this.name,
    required this.image,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) =>
      _$InstructorFromJson(json);

  Map<String, dynamic> toJson() => _$InstructorToJson(this);
}
