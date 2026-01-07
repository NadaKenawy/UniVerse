import 'package:json_annotation/json_annotation.dart';

part 'student_courses_response.g.dart';

@JsonSerializable()
class StudentCoursesResponse {
  final String status;
  final int count;
  final CoursesFilters filters;
  final List<StudentCourseItem>? courses;

  StudentCoursesResponse({
    required this.status,
    required this.count,
    required this.filters,
    this.courses,
  });

  factory StudentCoursesResponse.fromJson(Map<String, dynamic> json) =>
      _$StudentCoursesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StudentCoursesResponseToJson(this);
}

@JsonSerializable()
class CoursesFilters {
  final String level;
  final String type;

  CoursesFilters({required this.level, required this.type});

  factory CoursesFilters.fromJson(Map<String, dynamic> json) =>
      _$CoursesFiltersFromJson(json);

  Map<String, dynamic> toJson() => _$CoursesFiltersToJson(this);
}

@JsonSerializable()
class StudentCourseItem {
  @JsonKey(name: '_id')
  final String id;
  final String type;
  final String level;
  final CourseBrief course;

  StudentCourseItem({
    required this.id,
    required this.type,
    required this.level,
    required this.course,
  });

  factory StudentCourseItem.fromJson(Map<String, dynamic> json) =>
      _$StudentCourseItemFromJson(json);

  Map<String, dynamic> toJson() => _$StudentCourseItemToJson(this);
}

@JsonSerializable()
class CourseBrief {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final int hours;
  final String location;
  final CourseProfessor professor;

  CourseBrief({
    required this.id,
    required this.name,
    required this.hours,
    required this.location,
    required this.professor,
  });

  factory CourseBrief.fromJson(Map<String, dynamic> json) =>
      _$CourseBriefFromJson(json);

  Map<String, dynamic> toJson() => _$CourseBriefToJson(this);
}

@JsonSerializable()
class CourseProfessor {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final String profileImage;

  CourseProfessor({
    required this.id,
    required this.name,
    required this.profileImage,
  });

  factory CourseProfessor.fromJson(Map<String, dynamic> json) =>
      _$CourseProfessorFromJson(json);

  Map<String, dynamic> toJson() => _$CourseProfessorToJson(this);
}
