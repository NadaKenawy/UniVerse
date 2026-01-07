import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universe/core/theme/colors_manager.dart';
import 'package:universe/core/theme/text_styles.dart';
import 'package:universe/features/enrolled_courses/logic/student_courses/student_courses_cubit.dart';
import 'package:universe/features/enrolled_courses/logic/student_courses/student_courses_state.dart';
import 'package:universe/features/enrolled_courses/presentation/widgets/course_card.dart';

class EnrolledCoursesScreenBody extends StatefulWidget {
  const EnrolledCoursesScreenBody({super.key});

  @override
  State<EnrolledCoursesScreenBody> createState() =>
      _EnrolledCoursesScreenBodyState();
}

class _EnrolledCoursesScreenBodyState extends State<EnrolledCoursesScreenBody> {
  String _selectedAcademicYear = '1st Year'; // Default academic year

  final List<String> _academicYears = [
    '1st Year',
    '2nd Year',
    '3rd Year',
    '4th Year',
  ];

  @override
  void initState() {
    super.initState();
    context.read<StudentCoursesCubit>().fetchStudentCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64.h,
        title: Text(
          'Enrolled Courses',
          style: TextStyles.font24WhiteBold.copyWith(fontSize: 20.sp),
        ),
        backgroundColor: ColorsManager.primary,
        iconTheme: IconThemeData(color: Colors.white, size: 24.sp),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: PopupMenuButton<String>(
              offset: Offset(16.w, 24.h),
              color: Colors.white,
              onSelected: (value) {
                setState(() {
                  _selectedAcademicYear = value;
                });
              },
              itemBuilder: (context) {
                return _academicYears.map((year) {
                  return PopupMenuItem<String>(
                    value: year,
                    child: Text(year, style: TextStyles.font14BlackMedium),
                  );
                }).toList();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _selectedAcademicYear,
                    style: TextStyles.font14WhiteBold,
                  ),
                  Icon(Icons.arrow_drop_down, color: Colors.white, size: 20.sp),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 16.h),
            Expanded(
              child: BlocBuilder<StudentCoursesCubit, StudentCoursesState>(
                builder: (context, state) {
                  return state.when(
                    initial: () =>
                        const Center(child: CircularProgressIndicator()),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    success: (data) {
                      final allCourses = data.courses ?? [];
                      final filteredCourses = allCourses.where((courseItem) {
                        return courseItem.level == _selectedAcademicYear;
                      }).toList();

                      if (filteredCourses.isEmpty) {
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
                              'No courses found for $_selectedAcademicYear',
                              style: TextStyles.font16BlackBold,
                            ),
                          ],
                        );
                      }
                      return ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: filteredCourses.length,
                        separatorBuilder: (_, _) => SizedBox(height: 14.h),
                        itemBuilder: (context, index) {
                          final courseItem = filteredCourses[index];
                          return CourseCard(courseItem: courseItem);
                        },
                      );
                    },
                    error: (error) => Center(
                      child: Text(error, style: TextStyles.font16BlackBold),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
