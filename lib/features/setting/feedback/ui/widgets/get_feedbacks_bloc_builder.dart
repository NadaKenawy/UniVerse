import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universe/core/theme/text_styles.dart';
import 'package:universe/core/widgets/custom_button.dart';
import 'package:universe/features/setting/feedback/logic/get_reports_cubit/get_reports_cubit.dart';
import 'package:universe/features/setting/feedback/logic/get_reports_cubit/get_reports_state.dart';
import 'feedback_screen_body.dart';

class GetFeedbacksBlocBuilder extends StatelessWidget {
  const GetFeedbacksBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetReportsCubit, GetReportsState>(
      builder: (context, state) {
        return state.when(
          initial: () => FeedbackScreenBodySkeleton(avgRating: 0.0, totalReviews: 0),
          loading:
              () => FeedbackScreenBodySkeleton(avgRating: 0.0, totalReviews: 0),
          success:
              (getFeedbacksResponse) => FeedbackScreenBody(
                getFeedbacksResponse: getFeedbacksResponse,
              ),
          error: (error) => Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64.sp,
                    color: Colors.red,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Error',
                    style: TextStyles.font24BlackBold,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    error,
                    style: TextStyles.font16BlackMedium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24.h),
                  AppTextButton(
                    buttonText: 'Retry',
                    onPressed: () {
                      context.read<GetReportsCubit>().getFeedbacks();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
