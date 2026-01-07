import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universe/core/theme/colors_manager.dart';
import 'package:universe/core/theme/text_styles.dart';
import 'package:universe/features/courses_registration/data/models/available_subjects/available_subjects_response.dart';
import 'package:universe/features/courses_registration/presentation/widgets/course_card.dart';
import 'package:universe/features/courses_registration/presentation/widgets/hour_credit_card.dart';

class CoursesRegistrationScreenBody extends StatelessWidget {
  final AvailableSubjectsResponse data;

  const CoursesRegistrationScreenBody({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64.h,
        title: Text(
          'Courses Registration',
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
            Row(
              children: [
                Expanded(
                  child: HourCreditCard(
                    title: 'Max Allowed Hours',
                    value: data.meta.maxAllowedHours.toString(),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: HourCreditCard(
                    title: 'Current Hours',
                    value: data.meta.currentHours.toString(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: data.data.isEmpty
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
                          'No courses found',
                          style: TextStyles.font16BlackBold,
                        ),
                      ],
                    )
                  : ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: data.data.length,
                      separatorBuilder: (_, _) => SizedBox(height: 14.h),
                      itemBuilder: (context, index) =>
                          CourseCard(subjectData: data.data[index]),
                    ),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
