import 'package:flutter/material.dart';
import 'package:universe/features/enrolled_courses/data/models/student_courses/student_courses_response.dart';
import 'package:universe/features/enrolled_courses/presentation/widgets/course_details_screen_body.dart';

class EnrolledCourseDetailsScreen extends StatelessWidget {
  final StudentCourseItem? courseItem;

  const EnrolledCourseDetailsScreen({super.key, this.courseItem});

  @override
  Widget build(BuildContext context) {
    return CourseDetailsScreenBody(courseItem: courseItem);
  }
}
