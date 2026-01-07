import 'package:json_annotation/json_annotation.dart';

part 'course_details_response.g.dart';

@JsonSerializable()
class CourseDetailsResponse {
  final String status;
  final Course? course;
  final List<Lecture>? lectures;
  final CourseSection? section;
  final List<Lecture>? sections;

  CourseDetailsResponse({
    required this.status,
    this.course,
    this.lectures,
    this.section,
    this.sections,
  });

  factory CourseDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseDetailsResponseToJson(this);
}

@JsonSerializable()
class Course {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? description;
  final int? hours;
  final String? location;
  final List<Schedule>? schedule;
  final List<String>? matrialLinks;
  final List<String>? quizLinks;
  final Professor? professor;

  Course({
    this.id,
    this.name,
    this.description,
    this.hours,
    this.location,
    this.schedule,
    this.matrialLinks,
    this.quizLinks,
    this.professor,
  });

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);
}

@JsonSerializable()
class CourseSection {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? description;
  final int? hours;
  final String? location;
  final List<Schedule>? schedule;
  final List<String>? matrialLinks;
  final List<String>? quizLinks;
  final Professor? professor;

  CourseSection({
    this.id,
    this.name,
    this.description,
    this.hours,
    this.location,
    this.schedule,
    this.matrialLinks,
    this.quizLinks,
    this.professor,
  });

  factory CourseSection.fromJson(Map<String, dynamic> json) =>
      _$CourseSectionFromJson(json);

  Map<String, dynamic> toJson() => _$CourseSectionToJson(this);
}

@JsonSerializable()
class Lecture {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final List<String>? links;

  Lecture({this.id, this.name, this.links});

  factory Lecture.fromJson(Map<String, dynamic> json) =>
      _$LectureFromJson(json);

  Map<String, dynamic> toJson() => _$LectureToJson(this);
}

@JsonSerializable()
class Professor {
  final String? name;
  final String? profileImage;

  Professor({this.name, this.profileImage});

  factory Professor.fromJson(Map<String, dynamic> json) =>
      _$ProfessorFromJson(json);

  Map<String, dynamic> toJson() => _$ProfessorToJson(this);
}

@JsonSerializable()
class Schedule {
  final String? day;
  final String? startTime;
  final String? endTime;

  Schedule({this.day, this.startTime, this.endTime});

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleToJson(this);
}
