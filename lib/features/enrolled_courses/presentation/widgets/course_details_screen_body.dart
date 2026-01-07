import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universe/core/theme/colors_manager.dart';
import 'package:universe/core/theme/text_styles.dart';
import 'package:universe/features/enrolled_courses/data/models/student_courses/student_courses_response.dart';
import 'package:universe/features/enrolled_courses/logic/course_details/course_details_cubit.dart';
import 'package:universe/features/enrolled_courses/logic/course_details/course_details_state.dart';
import 'package:universe/features/enrolled_courses/presentation/widgets/lectures_resources_widget.dart';

class CourseDetailsScreenBody extends StatelessWidget {
  final StudentCourseItem? courseItem;

  const CourseDetailsScreenBody({super.key, this.courseItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64.h,
        title: Text(
          'Course Details',
          style: TextStyles.font24WhiteBold.copyWith(fontSize: 20.sp),
        ),
        backgroundColor: ColorsManager.primary,
        iconTheme: IconThemeData(color: Colors.white, size: 24.sp),
      ),
      body: BlocBuilder<CourseDetailsCubit, CourseDetailsState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (data) => SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Lecture Details
                  if (courseItem != null) ...[
                    Text(
                      'Lecture Details',
                      style: TextStyles.font16BlackBold.copyWith(
                        fontSize: 20.sp,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(color: Colors.white),
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.r),
                            child: Image.network(
                              courseItem!.course.professor.profileImage,
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
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dr. ${courseItem!.course.professor.name}',
                                  style: TextStyles.font14BlackSemiBold,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 4.h),
                                // Schedule
                                if ((data.course!.schedule?.isNotEmpty ??
                                    false)) ...[
                                  ...(data.course!.schedule!.map(
                                    (schedule) => Padding(
                                      padding: EdgeInsets.only(
                                        bottom:
                                            data.course!.schedule!.indexOf(
                                                  schedule,
                                                ) <
                                                data.course!.schedule!.length -
                                                    1
                                            ? 4.h
                                            : 0,
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.calendar_month_outlined,
                                            size: 16.sp,
                                            color: ColorsManager.primary,
                                          ),
                                          SizedBox(width: 6.w),
                                          Expanded(
                                            child: Text(
                                              '${schedule.day ?? 'Unknown'}, ${schedule.startTime ?? '00:00'} - ${schedule.endTime ?? '00:00'}',
                                              style:
                                                  TextStyles.font14BlackMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                                ],
                                SizedBox(height: 4.h), // Location
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 16.sp,
                                      color: ColorsManager.primary,
                                    ),
                                    SizedBox(width: 6.w),
                                    Expanded(
                                      child: Text(
                                        courseItem!.course.location,
                                        style: TextStyles.font14BlackMedium,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],

                  SizedBox(height: 12.h),

                  // Section Details
                  if (data.section != null) ...[
                    Text(
                      'Section Details',
                      style: TextStyles.font16BlackBold.copyWith(
                        fontSize: 20.sp,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(color: Colors.white),
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.r),
                            child: data.section!.professor?.profileImage != null
                                ? Image.network(
                                    data.section!.professor!.profileImage!,
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
                                  )
                                : Image.asset(
                                    'assets/images/download.jpg',
                                    width: 88.w,
                                    height: 80.h,
                                    fit: BoxFit.fitHeight,
                                  ),
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dr. ${data.section!.professor?.name ?? 'Unknown'}',
                                  style: TextStyles.font14BlackSemiBold,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 4.h),
                                // Schedule
                                if ((data.section!.schedule?.isNotEmpty ??
                                    false)) ...[
                                  ...(data.section!.schedule!.map(
                                    (schedule) => Padding(
                                      padding: EdgeInsets.only(
                                        bottom:
                                            data.section!.schedule!.indexOf(
                                                  schedule,
                                                ) <
                                                data.section!.schedule!.length -
                                                    1
                                            ? 4.h
                                            : 0,
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.calendar_month_outlined,
                                            size: 16.sp,
                                            color: ColorsManager.primary,
                                          ),
                                          SizedBox(width: 6.w),
                                          Expanded(
                                            child: Text(
                                              '${schedule.day ?? 'Unknown'}, ${schedule.startTime ?? '00:00'} - ${schedule.endTime ?? '00:00'}',
                                              style:
                                                  TextStyles.font14BlackMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                                ],
                                SizedBox(height: 4.h),
                                // Location
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 16.sp,
                                      color: ColorsManager.primary,
                                    ),
                                    SizedBox(width: 6.w),
                                    Expanded(
                                      child: Text(
                                        data.section!.location ??
                                            'Unknown location',
                                        style: TextStyles.font14BlackMedium,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],

                  SizedBox(height: 12.h),

                  // Course Info
                  if (courseItem != null) ...[
                    Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(color: Colors.white),
                      width: double.infinity,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  '${courseItem!.course.hours} Credit hours. ',
                              style: TextStyles.font14PrimarySemiBold,
                            ),
                            TextSpan(
                              text: data.course?.description,
                              style: TextStyles.font14BlackSemiBold,
                            ),
                          ],
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                    ),
                  ],

                  SizedBox(height: 12.h),

                  // Lectures Section
                  LecturesResourcesWidget(
                    title: 'Lectures',
                    lectures: data.lectures ?? [],
                    materialLinks: data.course?.matrialLinks,
                    quizLinks: data.course?.quizLinks,
                  ),

                  SizedBox(height: 12.h),

                  // Sections
                  LecturesResourcesWidget(
                    title: 'Sections',
                    lectures: data.sections ?? [],
                    materialLinks: data.section?.matrialLinks,
                    quizLinks: data.section?.quizLinks,
                  ),

                  SizedBox(height: 24.h),
                ],
              ),
            ),
            error: (error) =>
                Center(child: Text(error, style: TextStyles.font16BlackBold)),
          );
        },
      ),
    );
  }
}
