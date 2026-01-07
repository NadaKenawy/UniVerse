// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_subjects_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailableSubjectsResponse _$AvailableSubjectsResponseFromJson(
  Map<String, dynamic> json,
) => AvailableSubjectsResponse(
  status: json['status'] as String,
  meta: MetaData.fromJson(json['meta'] as Map<String, dynamic>),
  count: (json['count'] as num).toInt(),
  data: (json['data'] as List<dynamic>)
      .map((e) => AvailableSubjectData.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AvailableSubjectsResponseToJson(
  AvailableSubjectsResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'meta': instance.meta,
  'count': instance.count,
  'data': instance.data,
};

MetaData _$MetaDataFromJson(Map<String, dynamic> json) => MetaData(
  currentHours: (json['currentHours'] as num).toInt(),
  maxAllowedHours: (json['maxAllowedHours'] as num).toInt(),
);

Map<String, dynamic> _$MetaDataToJson(MetaData instance) => <String, dynamic>{
  'currentHours': instance.currentHours,
  'maxAllowedHours': instance.maxAllowedHours,
};

AvailableSubjectData _$AvailableSubjectDataFromJson(
  Map<String, dynamic> json,
) => AvailableSubjectData(
  failedBefore: json['failedBefore'] as bool,
  subject: Subject.fromJson(json['subject'] as Map<String, dynamic>),
  section: Section.fromJson(json['section'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AvailableSubjectDataToJson(
  AvailableSubjectData instance,
) => <String, dynamic>{
  'failedBefore': instance.failedBefore,
  'subject': instance.subject,
  'section': instance.section,
};

Subject _$SubjectFromJson(Map<String, dynamic> json) => Subject(
  id: json['id'] as String,
  name: json['name'] as String,
  doctorName: json['doctorName'] as String,
  doctorImage: json['doctorImage'] as String,
  hours: (json['hours'] as num).toInt(),
  location: json['location'] as String,
  about: json['about'] as String,
  schedule: (json['schedule'] as List<dynamic>)
      .map((e) => Schedule.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SubjectToJson(Subject instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'doctorName': instance.doctorName,
  'doctorImage': instance.doctorImage,
  'hours': instance.hours,
  'location': instance.location,
  'about': instance.about,
  'schedule': instance.schedule,
};

Section _$SectionFromJson(Map<String, dynamic> json) => Section(
  id: json['id'] as String,
  assistantName: json['assistantName'] as String,
  assistantImage: json['assistantImage'] as String,
  location: json['location'] as String,
  schedule: (json['schedule'] as List<dynamic>)
      .map((e) => Schedule.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SectionToJson(Section instance) => <String, dynamic>{
  'id': instance.id,
  'assistantName': instance.assistantName,
  'assistantImage': instance.assistantImage,
  'location': instance.location,
  'schedule': instance.schedule,
};

Schedule _$ScheduleFromJson(Map<String, dynamic> json) => Schedule(
  day: json['day'] as String,
  startTime: json['startTime'] as String,
  endTime: json['endTime'] as String,
);

Map<String, dynamic> _$ScheduleToJson(Schedule instance) => <String, dynamic>{
  'day': instance.day,
  'startTime': instance.startTime,
  'endTime': instance.endTime,
};
