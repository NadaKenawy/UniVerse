import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universe/features/courses_schedule/logic/schedule_cubit.dart';
import 'package:universe/features/courses_schedule/presentation/widgets/courses_schedule_screen_body.dart';

class CoursesScheduleScreen extends StatefulWidget {
  const CoursesScheduleScreen({super.key});

  @override
  State<CoursesScheduleScreen> createState() => _CoursesScheduleScreenState();
}

class _CoursesScheduleScreenState extends State<CoursesScheduleScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ScheduleCubit>().fetchSchedule();
  }

  @override
  Widget build(BuildContext context) {
    return const CoursesScheduleScreenBody();
  }
}
