import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:universe/app/router.dart';
import 'package:universe/core/theme/colors_manager.dart';
import 'package:universe/core/theme/text_styles.dart';
import 'package:universe/features/home/logic/home_cubit.dart';
import 'package:universe/features/home/logic/home_state.dart';
import 'package:universe/features/home/presentation/widgets/action_card.dart';
import 'package:universe/features/home/presentation/widgets/info_card.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (homeDataResponse) {
            final data = homeDataResponse.data;
            return SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// ===== Header =====
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundImage:
                              (data.profileImage != null &&
                                  data.profileImage!.isNotEmpty)
                              ? NetworkImage(data.profileImage!)
                              : const AssetImage('assets/images/download.jpg')
                                    as ImageProvider,
                        ),
                        SizedBox(width: 12.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome 👋',
                              style: TextStyles.font14BlackMedium,
                            ),
                            Text(
                              data.name,
                              style: TextStyles.font16BlackSemiBold,
                            ),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(16.r),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: ColorsManager.primary.withValues(
                                  alpha: 0.1,
                                ),
                                spreadRadius: 1,
                                blurRadius: 6,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: IconButton(
                            onPressed: () {
                              GoRouter.of(
                                context,
                              ).push(AppRouter.kNotificationsScreen);
                            },
                            icon: const Icon(
                              Icons.notifications_none_outlined,
                              color: ColorsManager.primary,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 24.h),

                    /// ===== GPA =====
                    Row(
                      children: [
                        Expanded(
                          child: InfoCard(
                            title: 'Cumulative GPA',
                            value: data.GPA.toString(),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: InfoCard(
                            title: 'Completed Hours',
                            value: data.completeHours.toString(),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 24.h),

                    /// ===== Blue Card =====
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: ColorsManager.primary,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${data.department} ${homeDataResponse.currentTerm}',
                            style: TextStyles.font24WhiteSemiBold.copyWith(
                              fontSize: 20.sp,
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            'Level ${data.level}',
                            style: TextStyles.font14WhiteMedium,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 24.h),

                    Text(
                      'What would you like to do?',
                      style: TextStyles.font16BlackBold,
                    ),

                    SizedBox(height: 12.h),

                    /// ===== Grid =====
                    GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.w,
                      mainAxisSpacing: 12.h,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        ActionCard(
                          icon: Icons.menu_book_outlined,
                          title: 'Courses Registration',
                          subtitle:
                              'Choose your courses and register them in minutes.',
                          onTap: () => GoRouter.of(
                            context,
                          ).push(AppRouter.kCoursesRegistrationScreen),
                        ),
                        ActionCard(
                          icon: Icons.calendar_today_outlined,
                          title: 'Courses Schedule',
                          subtitle: 'Track your classes and timings easily.',
                          onTap: () => GoRouter.of(
                            context,
                          ).push(AppRouter.kCoursesScheduleScreen),
                        ),
                        ActionCard(
                          icon: Icons.bookmark_outline,
                          title: 'Enrolled Courses',
                          subtitle:
                              'Manage all your enrolled courses effortlessly.',
                          onTap: () => GoRouter.of(
                            context,
                          ).push(AppRouter.kEnrolledCoursesScreen),
                        ),
                        ActionCard(
                          icon: Icons.check_circle_outline,
                          title: 'Attended Courses',
                          subtitle: 'See your attended courses in one place.',
                          onTap: () => GoRouter.of(
                            context,
                          ).push(AppRouter.kAttendedCoursesScreen),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          error: (error) => Center(child: Text('Error: $error')),
        );
      },
    );
  }
}
