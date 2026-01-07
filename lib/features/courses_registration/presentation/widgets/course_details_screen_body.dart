import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:universe/core/theme/colors_manager.dart';
import 'package:universe/core/theme/text_styles.dart';
import 'package:universe/core/widgets/custom_button.dart';
import 'package:universe/features/courses_registration/data/models/available_subjects/available_subjects_response.dart';
import 'package:universe/features/courses_registration/logic/register_subject/register_subject_cubit.dart';
import 'package:universe/features/courses_registration/logic/register_subject/register_subject_state.dart';

class CourseDetailsScreenBody extends StatelessWidget {
  final AvailableSubjectData subjectData;

  const CourseDetailsScreenBody({super.key, required this.subjectData});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterSubjectCubit, RegisterSubjectState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (data) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              animType: AnimType.rightSlide,
              title: 'Success',
              titleTextStyle: TextStyles.font24BlackBold,
              desc: 'Enrolled successfully!',
              descTextStyle: TextStyles.font16BlackRegular,
              btnOkOnPress: () {
                context.pop();
              },
            ).show();
          },
          error: (error) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.rightSlide,
              title: 'Error',
              titleTextStyle: TextStyles.font24BlackBold,
              desc: error,
              descTextStyle: TextStyles.font16BlackRegular,
              btnOkOnPress: () {},
            ).show();
          },
        );
      },
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 64.h,
            title: Text(
              'Courses Details',
              style: TextStyles.font24WhiteBold.copyWith(fontSize: 20.sp),
            ),
            backgroundColor: ColorsManager.primary,
            iconTheme: IconThemeData(color: Colors.white, size: 24.sp),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Lecture Details
                Text(
                  'Lecture Details',
                  style: TextStyles.font16BlackBold.copyWith(fontSize: 20.sp),
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
                          subjectData.subject.doctorImage,
                          width: 88.w,
                          height: 100.h,
                          fit: BoxFit.fitHeight,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/images/download.jpg',
                              width: 88.w,
                              height: 100.h,
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
                              'Dr. ${subjectData.subject.doctorName}',
                              style: TextStyles.font14BlackSemiBold,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 4.h),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: subjectData.subject.schedule.length,
                              itemBuilder: (context, index) {
                                final schedule =
                                    subjectData.subject.schedule[index];
                                return Padding(
                                  padding: EdgeInsets.only(
                                    bottom:
                                        index <
                                            subjectData
                                                    .subject
                                                    .schedule
                                                    .length -
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
                                          '${schedule.day}, ${schedule.startTime} - ${schedule.endTime}',
                                          style: TextStyles.font14BlackMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
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
                                Expanded(
                                  child: Text(
                                    subjectData.subject.location,
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

                SizedBox(height: 12.h),

                // Section Details
                Text(
                  'Section Details',
                  style: TextStyles.font16BlackBold.copyWith(fontSize: 20.sp),
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
                          subjectData.section.assistantImage,
                          width: 88.w,
                          height: 100.h,
                          fit: BoxFit.fitHeight,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/images/download.jpg',
                              width: 88.w,
                              height: 100.h,
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
                              'Dr. ${subjectData.section.assistantName}',
                              style: TextStyles.font14BlackSemiBold,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 4.h),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: subjectData.section.schedule.length,
                              itemBuilder: (context, index) {
                                final schedule =
                                    subjectData.section.schedule[index];
                                return Padding(
                                  padding: EdgeInsets.only(
                                    bottom:
                                        index <
                                            subjectData
                                                    .section
                                                    .schedule
                                                    .length -
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
                                          '${schedule.day}, ${schedule.startTime} - ${schedule.endTime}',
                                          style: TextStyles.font14BlackMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
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
                                Expanded(
                                  child: Text(
                                    subjectData.section.location,
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

                SizedBox(height: 12.h),
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(color: Colors.white),
                  width: double.infinity,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${subjectData.subject.hours} Credit hours. ',
                          style: TextStyles.font14PrimarySemiBold,
                        ),
                        TextSpan(
                          text: subjectData.subject.about,
                          style: TextStyles.font14BlackSemiBold,
                        ),
                      ],
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                ),

                SizedBox(height: 20.h),
                SizedBox(
                  width: double.infinity,
                  child: AppTextButton(
                    buttonText: "Enroll Now",
                    isLoading: isLoading,
                    onPressed: () {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.warning,
                        animType: AnimType.rightSlide,
                        title: 'Confirm Enrollment',
                        titleTextStyle: TextStyles.font24BlackBold,
                        desc: 'Are you sure you want to enroll in this course?',
                        descTextStyle: TextStyles.font16BlackRegular,
                        btnOkText: 'Confirm',
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {
                          context.read<RegisterSubjectCubit>().registerSubject(
                            courseId: subjectData.subject.id,
                            sectionId: subjectData.section.id,
                          );
                        },
                      ).show();
                    },
                  ),
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
