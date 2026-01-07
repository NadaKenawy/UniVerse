import 'package:json_annotation/json_annotation.dart';

part 'absence_percentage_response.g.dart';

@JsonSerializable()
class AbsencePercentageResponse {
  final String status;
  final int count;
  final String? type;
  final List<AbsenceCourseData> data;

  AbsencePercentageResponse({
    required this.status,
    required this.count,
    this.type,
    required this.data,
  });

  factory AbsencePercentageResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AbsencePercentageResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AbsencePercentageResponseToJson(this);
}

@JsonSerializable()
class AbsenceCourseData {
  final String courseId;
  final String courseName;
  final String professorName;
  final String professorImage;
  final int totalLectures;
  final int attendedLectures;
  final int absentLectures;
  final double absencePercentage;

  AbsenceCourseData({
    required this.courseId,
    required this.courseName,
    required this.professorName,
    required this.professorImage,
    required this.totalLectures,
    required this.attendedLectures,
    required this.absentLectures,
    required this.absencePercentage,
  });

  factory AbsenceCourseData.fromJson(
          Map<String, dynamic> json) =>
      _$AbsenceCourseDataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AbsenceCourseDataToJson(this);
}
