import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:universe/app/router.dart';
import 'package:universe/core/theme/colors_manager.dart';
import 'package:universe/core/theme/text_styles.dart';
import 'package:universe/core/widgets/custom_button.dart';
import 'package:universe/features/courses_registration/data/models/available_subjects/available_subjects_response.dart';
import 'package:universe/features/courses_registration/logic/register_subject/register_subject_cubit.dart';
import 'package:universe/features/courses_registration/logic/register_subject/register_subject_state.dart';

class CourseCard extends StatelessWidget {
  final AvailableSubjectData subjectData;

  const CourseCard({super.key, required this.subjectData});

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
              btnOkOnPress: () {},
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
        final subject = subjectData.subject;
        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(
              color: (subjectData.failedBefore)
                  ? ColorsManager.error
                  : ColorsManager.primary,
              width: 2.w,
            ),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.network(
                      subject.doctorImage,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          subject.name,
                          style: TextStyles.font24BlackBold.copyWith(
                            fontSize: 18.sp,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Dr. ${subject.doctorName}',
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
                              '${subject.hours} Credit hour${subject.hours > 1 ? 's' : ''}',
                              style: TextStyles.font14BlackMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  Expanded(
                    child: AppTextButton(
                      buttonText: 'Enroll Now',
                      isLoading: isLoading,
                      onPressed: () {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.warning,
                          animType: AnimType.rightSlide,
                          title: 'Confirm Enrollment',
                          titleTextStyle: TextStyles.font24BlackBold,
                          btnOkText: 'Confirm',
                          desc:
                              'Are you sure you want to enroll in this course?',
                          descTextStyle: TextStyles.font16BlackRegular,
                          btnCancelOnPress: () {},
                          btnOkOnPress: () {
                            context
                                .read<RegisterSubjectCubit>()
                                .registerSubject(
                                  courseId: subjectData.subject.id,
                                  sectionId: subjectData.section.id,
                                );
                          },
                        ).show();
                      },
                      buttonHeight: 40.h,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: AppTextButton(
                      buttonText: 'View Details',
                      onPressed: () {
                        GoRouter.of(context).push(
                          AppRouter.kCourseDetailsScreen,
                          extra: subjectData,
                        );
                      },
                      buttonHeight: 40.h,
                      backgroundColor: ColorsManager.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
