// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseDetailsResponse _$CourseDetailsResponseFromJson(
  Map<String, dynamic> json,
) => CourseDetailsResponse(
  status: json['status'] as String,
  course: json['course'] == null
      ? null
      : Course.fromJson(json['course'] as Map<String, dynamic>),
  lectures: (json['lectures'] as List<dynamic>?)
      ?.map((e) => Lecture.fromJson(e as Map<String, dynamic>))
      .toList(),
  section: json['section'] == null
      ? null
      : CourseSection.fromJson(json['section'] as Map<String, dynamic>),
  sections: (json['sections'] as List<dynamic>?)
      ?.map((e) => Lecture.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CourseDetailsResponseToJson(
  CourseDetailsResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'course': instance.course,
  'lectures': instance.lectures,
  'section': instance.section,
  'sections': instance.sections,
};

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
  id: json['_id'] as String?,
  name: json['name'] as String?,
  description: json['description'] as String?,
  hours: (json['hours'] as num?)?.toInt(),
  location: json['location'] as String?,
  schedule: (json['schedule'] as List<dynamic>?)
      ?.map((e) => Schedule.fromJson(e as Map<String, dynamic>))
      .toList(),
  matrialLinks: (json['matrialLinks'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  quizLinks: (json['quizLinks'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  professor: json['professor'] == null
      ? null
      : Professor.fromJson(json['professor'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
  '_id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'hours': instance.hours,
  'location': instance.location,
  'schedule': instance.schedule,
  'matrialLinks': instance.matrialLinks,
  'quizLinks': instance.quizLinks,
  'professor': instance.professor,
};

CourseSection _$CourseSectionFromJson(Map<String, dynamic> json) =>
    CourseSection(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      hours: (json['hours'] as num?)?.toInt(),
      location: json['location'] as String?,
      schedule: (json['schedule'] as List<dynamic>?)
          ?.map((e) => Schedule.fromJson(e as Map<String, dynamic>))
          .toList(),
      matrialLinks: (json['matrialLinks'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      quizLinks: (json['quizLinks'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      professor: json['professor'] == null
          ? null
          : Professor.fromJson(json['professor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CourseSectionToJson(CourseSection instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'hours': instance.hours,
      'location': instance.location,
      'schedule': instance.schedule,
      'matrialLinks': instance.matrialLinks,
      'quizLinks': instance.quizLinks,
      'professor': instance.professor,
    };

Lecture _$LectureFromJson(Map<String, dynamic> json) => Lecture(
  id: json['_id'] as String?,
  name: json['name'] as String?,
  links: (json['links'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$LectureToJson(Lecture instance) => <String, dynamic>{
  '_id': instance.id,
  'name': instance.name,
  'links': instance.links,
};

Professor _$ProfessorFromJson(Map<String, dynamic> json) => Professor(
  name: json['name'] as String?,
  profileImage: json['profileImage'] as String?,
);

Map<String, dynamic> _$ProfessorToJson(Professor instance) => <String, dynamic>{
  'name': instance.name,
  'profileImage': instance.profileImage,
};

Schedule _$ScheduleFromJson(Map<String, dynamic> json) => Schedule(
  day: json['day'] as String?,
  startTime: json['startTime'] as String?,
  endTime: json['endTime'] as String?,
);

Map<String, dynamic> _$ScheduleToJson(Schedule instance) => <String, dynamic>{
  'day': instance.day,
  'startTime': instance.startTime,
  'endTime': instance.endTime,
};
