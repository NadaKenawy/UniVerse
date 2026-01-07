import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:universe/core/theme/colors_manager.dart';
import 'package:universe/core/theme/text_styles.dart';
import 'package:universe/features/courses_schedule/logic/schedule_cubit.dart';
import 'package:universe/features/courses_schedule/logic/schedule_state.dart';
import 'package:universe/features/courses_schedule/presentation/widgets/course_models.dart';
import 'select_schedule_card.dart';
import 'course_card.dart';

class CoursesScheduleScreenBody extends StatefulWidget {
  const CoursesScheduleScreenBody({super.key});

  @override
  State<CoursesScheduleScreenBody> createState() =>
      _CoursesScheduleScreenBodyState();
}

class _CoursesScheduleScreenBodyState extends State<CoursesScheduleScreenBody> {
  int selectedIndex = 0;

  late final List<DayItem> days;

  @override
  void initState() {
    super.initState();
    final today = DateTime.now();
    days = List.generate(
      7,
      (i) => DayItem(
        date: DateTime(
          today.year,
          today.month,
          today.day,
        ).add(Duration(days: i)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedDay = days[selectedIndex];

    return BlocBuilder<ScheduleCubit, ScheduleState>(
      builder: (context, state) {
        return state.when(
          initial: () =>
              const Scaffold(body: Center(child: CircularProgressIndicator())),
          loading: () =>
              const Scaffold(body: Center(child: CircularProgressIndicator())),
          success: (scheduleResponse) {
            final dayCourses = scheduleResponse.courses
                .where((course) => course.day == selectedDay.fullDayName)
                .map((course) => CourseItem.fromScheduleCourse(course))
                .toList();

            return Scaffold(
              appBar: AppBar(
                toolbarHeight: 64.h,
                title: Text(
                  'Courses Schedule',
                  style: TextStyles.font24WhiteBold.copyWith(fontSize: 20.sp),
                ),
                backgroundColor: ColorsManager.primary,
                iconTheme: IconThemeData(color: Colors.white, size: 24.sp),
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    SizedBox(height: 16.h),

                    SelectScheduleCard(
                      days: days,
                      selectedIndex: selectedIndex,
                      onDayTap: (idx) => setState(() => selectedIndex = idx),
                    ),
                    SizedBox(height: 16.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        DateFormat(
                          'EEEE, d MMM yyyy',
                        ).format(days[selectedIndex].date),
                        style: TextStyles.font16BlackSemiBold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Expanded(
                      child: dayCourses.isEmpty
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.warning,
                                  color: ColorsManager.primary,
                                  size: 24.sp,
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  'No courses for this day.',
                                  style: TextStyles.font16BlackBold,
                                ),
                              ],
                            )
                          : ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              itemCount: dayCourses.length,
                              separatorBuilder: (_, _) =>
                                  SizedBox(height: 14.h),
                              itemBuilder: (context, index) =>
                                  CourseCard(course: dayCourses[index]),
                            ),
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            );
          },
          error: (error) =>
              Scaffold(body: Center(child: Text('Error: $error'))),
        );
      },
    );
  }
}
