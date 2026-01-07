import 'package:flutter/material.dart';
import 'package:universe/features/courses_registration/data/models/available_subjects/available_subjects_response.dart';
import 'package:universe/features/courses_registration/presentation/widgets/course_details_screen_body.dart';

class CourseDetailsScreen extends StatelessWidget {
  final AvailableSubjectData subjectData;

  const CourseDetailsScreen({super.key, required this.subjectData});

  @override
  Widget build(BuildContext context) {
    return CourseDetailsScreenBody(subjectData: subjectData);
  }
}
