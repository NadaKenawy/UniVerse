import 'package:universe/features/courses_schedule/data/model/schedule_response.dart';

class DayItem {
  final DateTime date;
  DayItem({required this.date});

  String get dayLabel => _weekdayShort(date.weekday);
  String get dayNumber => date.day.toString();

  String get fullDayName => _weekdayFull(date.weekday);

  static String _weekdayShort(int weekday) {
    const names = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
    return names[(weekday + 6) % 7];
  }

  static String _weekdayFull(int weekday) {
    const names = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    return names[(weekday + 6) % 7];
  }

  String get key =>
      '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
}

class CourseItem {
  final String title;
  final String teacher;
  final String type;
  final String time;
  final String place;
  final String imageUrl;

  CourseItem({
    required this.title,
    required this.teacher,
    required this.type,
    required this.time,
    required this.place,
    required this.imageUrl,
  });

  factory CourseItem.fromScheduleCourse(ScheduleCourse course) {
    return CourseItem(
      title: course.courseName,
      teacher: '${course.instructor.name} (${course.type})',
      type: course.type,
      time: '${course.startTime} - ${course.endTime}',
      place: course.location,
      imageUrl: course.instructor.image,
    );
  }
}
