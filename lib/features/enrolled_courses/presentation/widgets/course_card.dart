import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:universe/app/router.dart';
import 'package:universe/core/theme/colors_manager.dart';
import 'package:universe/core/theme/text_styles.dart';
import 'package:universe/features/enrolled_courses/data/models/student_courses/student_courses_response.dart';

class CourseCard extends StatelessWidget {
  final StudentCourseItem courseItem;

  const CourseCard({super.key, required this.courseItem});

  Color _getBorderColor() {
    switch (courseItem.status?.toLowerCase()) {
      case 'pass':
        return ColorsManager.success;
      case 'fail':
        return ColorsManager.error;
      default:
        return ColorsManager.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final courseId = courseItem.course.id;
        if (courseId.isNotEmpty) {
          GoRouter.of(context).push(
            '${AppRouter.kCourseDetailsScreenWithParam}/$courseId',
            extra: courseItem,
          );
        }
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: _getBorderColor(), width: 2.w),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.network(
                courseItem.course.professor.profileImage,
                width: 88.w,
                height: 80.h,
                fit: BoxFit.fitHeight,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/download.jpg',
                    width: 88.w,
                    height: 80.h,
                    fit: BoxFit.fitHeight,
                  );
                },
              ),
            ),
            SizedBox(width: 16.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  courseItem.course.name,
                  style: TextStyles.font24BlackBold.copyWith(fontSize: 18.sp),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  'Dr. ${courseItem.course.professor.name}',
                  style: TextStyles.font14BlackSemiBold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(
                      Icons.watch_later_outlined,
                      size: 16.sp,
                      color: ColorsManager.primary,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      '${courseItem.course.hours} hours',
                      style: TextStyles.font14BlackMedium,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
