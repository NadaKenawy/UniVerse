import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universe/core/theme/colors_manager.dart';
import 'package:universe/core/theme/text_styles.dart';
import 'package:universe/features/attended_courses/logic/absence_cubit.dart';
import 'package:universe/features/attended_courses/logic/absence_state.dart';
import 'package:universe/features/attended_courses/presentation/widgets/attended_courses_button.dart';
import 'package:universe/features/attended_courses/presentation/widgets/course_card.dart';

class AttendedCoursesScreenBody extends StatefulWidget {
  const AttendedCoursesScreenBody({super.key});

  @override
  State<AttendedCoursesScreenBody> createState() =>
      _AttendedCoursesScreenBodyState();
}

class _AttendedCoursesScreenBodyState extends State<AttendedCoursesScreenBody> {
  int selectedIndex = 0;
  String currentType = 'doctor';

  void _onTypeToggle(int index) {
    setState(() {
      selectedIndex = index;
      currentType = index == 0 ? 'doctor' : 'assistant';
    });
    context.read<AbsenceCubit>().fetchAbsencePercentage(type: currentType);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64.h,
        title: Text(
          'Attended Courses',
          style: TextStyles.font24WhiteBold.copyWith(fontSize: 20.sp),
        ),
        backgroundColor: ColorsManager.primary,
        iconTheme: IconThemeData(color: Colors.white, size: 24.sp),
      ),
      body: BlocBuilder<AbsenceCubit, AbsenceState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                SizedBox(height: 16.h),
                AttendedCoursesButton(
                  onToggle: _onTypeToggle,
                  selectedIndex: selectedIndex,
                ),
                SizedBox(height: 16.h),
                Expanded(
                  child: state.when(
                    initial: () =>
                        const Center(child: CircularProgressIndicator()),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    success: (absenceResponse) {
                      final courses = absenceResponse.data;
                      if (courses.isEmpty) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.warning,
                              color: ColorsManager.primary,
                              size: 24.sp,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              'No courses found',
                              style: TextStyles.font16BlackBold,
                            ),
                          ],
                        );
                      }
                      return ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: courses.length,
                        separatorBuilder: (_, _) => SizedBox(height: 14.h),
                        itemBuilder: (context, index) =>
                            CourseCard(courseData: courses[index]),
                      );
                    },
                    error: (error) => Center(child: Text('Error: $error')),
                  ),
                ),
                SizedBox(height: 24.h),
              ],
            ),
          );
        },
      ),
    );
  }
}
