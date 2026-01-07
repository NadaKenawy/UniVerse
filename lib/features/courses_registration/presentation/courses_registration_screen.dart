import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universe/core/widgets/custom_button.dart';
import 'package:universe/features/courses_registration/logic/available_subjects/available_subjects_cubit.dart';
import 'package:universe/features/courses_registration/logic/available_subjects/available_subjects_state.dart';
import 'package:universe/features/courses_registration/presentation/widgets/courses_registration_screen_body.dart';

class CoursesRegistrationScreen extends StatefulWidget {
  const CoursesRegistrationScreen({super.key});

  @override
  State<CoursesRegistrationScreen> createState() =>
      _CoursesRegistrationScreenState();
}

class _CoursesRegistrationScreenState extends State<CoursesRegistrationScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AvailableSubjectsCubit>().fetchAvailableSubjects();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AvailableSubjectsCubit, AvailableSubjectsState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () =>
              const Scaffold(body: Center(child: CircularProgressIndicator())),
          success: (data) => CoursesRegistrationScreenBody(data: data),
          error: (error) => Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: $error'),
                  AppTextButton(
                    onPressed: () {
                      context
                          .read<AvailableSubjectsCubit>()
                          .fetchAvailableSubjects();
                    },
                    buttonText: 'Retry',
                  ),
                ],
              ),
            ),
          ),
          orElse: () => const Scaffold(body: Center(child: Text('No data'))),
        );
      },
    );
  }
}
