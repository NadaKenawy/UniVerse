import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universe/core/theme/colors_manager.dart';
import 'package:universe/core/theme/text_styles.dart';
import 'package:universe/features/attended_courses/data/model/absence_percentage_response.dart';
import 'percentage_progress_bar.dart';

class CourseCard extends StatelessWidget {
  final AbsenceCourseData courseData;

  const CourseCard({super.key, required this.courseData});

  @override
  Widget build(BuildContext context) {
    final attendancePercentage = (100 - courseData.absencePercentage).clamp(
      0,
      100,
    );

    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: ColorsManager.primary, width: 2.w),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.network(
              courseData.professorImage,
              width: 88.w,
              height: 80.h,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => Image.asset(
                'assets/images/download.jpg',
                width: 88.w,
                height: 80.h,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  courseData.courseName,
                  style: TextStyles.font24BlackBold.copyWith(fontSize: 18.sp),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  'Dr. ${courseData.professorName}',
                  style: TextStyles.font14BlackSemiBold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.h),

                /// ===== Attendance =====
                Row(
                  children: [
                    Text(
                      'Attendance Percentage',
                      style: TextStyles.font14BlackSemiBold,
                    ),
                    const Spacer(),
                    Text(
                      '${attendancePercentage.toStringAsFixed(0)}%',
                      style: TextStyles.font14PrimaryBold,
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                PercentageProgressBar(
                  percentage: courseData.absencePercentage,
                  invertPercentage: true,
                  height: 8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
