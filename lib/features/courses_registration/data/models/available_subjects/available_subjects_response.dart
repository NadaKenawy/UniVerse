import 'package:json_annotation/json_annotation.dart';

part 'available_subjects_response.g.dart';

@JsonSerializable()
class AvailableSubjectsResponse {
  final String status;
  final MetaData meta;
  final int count;
  final List<AvailableSubjectData> data;

  AvailableSubjectsResponse({
    required this.status,
    required this.meta,
    required this.count,
    required this.data,
  });

  factory AvailableSubjectsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AvailableSubjectsResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AvailableSubjectsResponseToJson(this);
}

@JsonSerializable()
class MetaData {
  final int currentHours;
  final int maxAllowedHours;

  MetaData({
    required this.currentHours,
    required this.maxAllowedHours,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) =>
      _$MetaDataFromJson(json);

  Map<String, dynamic> toJson() => _$MetaDataToJson(this);
}

@JsonSerializable()
class AvailableSubjectData {
  final bool failedBefore;
  final Subject subject;
  final Section section;

  AvailableSubjectData({
    required this.failedBefore,
    required this.subject,
    required this.section,
  });

  factory AvailableSubjectData.fromJson(
          Map<String, dynamic> json) =>
      _$AvailableSubjectDataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AvailableSubjectDataToJson(this);
}

@JsonSerializable()
class Subject {
  final String id;
  final String name;
  final String doctorName;
  final String doctorImage;
  final int hours;
  final String location;
  final String about;
  final List<Schedule> schedule;

  Subject({
    required this.id,
    required this.name,
    required this.doctorName,
    required this.doctorImage,
    required this.hours,
    required this.location,
    required this.about,
    required this.schedule,
  });

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectToJson(this);
}

@JsonSerializable()
class Section {
  final String id;
  final String assistantName;
  final String assistantImage;
  final String location;
  final List<Schedule> schedule;

  Section({
    required this.id,
    required this.assistantName,
    required this.assistantImage,
    required this.location,
    required this.schedule,
  });

  factory Section.fromJson(Map<String, dynamic> json) =>
      _$SectionFromJson(json);

  Map<String, dynamic> toJson() => _$SectionToJson(this);
}

@JsonSerializable()
class Schedule {
  final String day;
  final String startTime;
  final String endTime;

  Schedule({
    required this.day,
    required this.startTime,
    required this.endTime,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleToJson(this);
}
