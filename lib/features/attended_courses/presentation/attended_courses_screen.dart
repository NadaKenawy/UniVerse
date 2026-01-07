import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universe/features/attended_courses/logic/absence_cubit.dart';
import 'package:universe/features/attended_courses/presentation/widgets/attended_courses_screen_body.dart';

class AttendedCoursesScreen extends StatefulWidget {
  const AttendedCoursesScreen({super.key});

  @override
  State<AttendedCoursesScreen> createState() => _AttendedCoursesScreenState();
}

class _AttendedCoursesScreenState extends State<AttendedCoursesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AbsenceCubit>().fetchAbsencePercentage(type: 'doctor');
  }

  @override
  Widget build(BuildContext context) {
    return const AttendedCoursesScreenBody();
  }
}
