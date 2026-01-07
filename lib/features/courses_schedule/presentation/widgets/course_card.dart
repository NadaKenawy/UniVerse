import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universe/core/theme/colors_manager.dart';
import 'package:universe/core/theme/text_styles.dart';
import 'package:universe/features/courses_schedule/presentation/widgets/course_models.dart';

class CourseCard extends StatelessWidget {
  final CourseItem course;
  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
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
              course.imageUrl,
              width: 88.w,
              height: 120.h,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => Image.asset(
                'assets/images/download.jpg',
                width: 88.w,
                height: 120.h,
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
                  course.title,
                  style: TextStyles.font24BlackBold.copyWith(fontSize: 18.sp),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  'Dr. ${course.teacher}',
                  style: TextStyles.font14BlackSemiBold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 16.sp,
                      color: ColorsManager.primary,
                    ),
                    SizedBox(width: 6.w),
                    Flexible(
                      child: Text(
                        course.type,
                        style: TextStyles.font14BlackMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
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
                    Text(course.time, style: TextStyles.font14BlackMedium),
                  ],
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 16.sp,
                      color: ColorsManager.primary,
                    ),
                    SizedBox(width: 6.w),
                    Text(course.place, style: TextStyles.font14BlackMedium),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
