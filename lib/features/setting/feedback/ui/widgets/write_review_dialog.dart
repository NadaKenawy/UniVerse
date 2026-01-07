import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universe/core/constants/user_cubit.dart';
import 'package:universe/core/constants/user_model.dart';
import 'package:universe/core/theme/text_styles.dart';
import 'package:universe/core/widgets/custom_button.dart';
import 'package:universe/core/widgets/custom_text_form_field.dart';
import 'package:universe/features/setting/feedback/logic/create_report_cubit/create_report_cubit.dart';
import 'package:universe/features/setting/feedback/logic/get_reports_cubit/get_reports_cubit.dart';
import 'package:universe/features/setting/feedback/logic/update_report_cubit/update_report_cubit.dart';

class WriteReviewDialog extends StatefulWidget {
  const WriteReviewDialog({
    super.key,
    required this.user,
    required this.createReportCubit,
    required this.updateReportCubit,
    required this.getFeedbacksCubit,
  });

  final UserModel user;
  final CreateReportCubit createReportCubit;
  final UpdateReportCubit updateReportCubit;
  final GetReportsCubit getFeedbacksCubit;

  @override
  State<WriteReviewDialog> createState() => _WriteReviewDialogState();
}

class _WriteReviewDialogState extends State<WriteReviewDialog> {
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    final createReportCubit = widget.createReportCubit;
    final updateReportCubit = widget.updateReportCubit;
    final controller = widget.user.createReport
        ? updateReportCubit.review
        : createReportCubit.review;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  iconSize: 24.sp,
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              Center(
                child: Text(
                  'Rate Your Experience',
                  style: TextStyles.font16BlackBold,
                ),
              ),
              SizedBox(height: 12.h),
              Center(
                child: RatingBar.builder(
                  initialRating: rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (_, _) =>
                      const Icon(Icons.star, color: Colors.amber),
                  unratedColor: Colors.grey[300],
                  onRatingUpdate: (value) {
                    setState(() {
                      rating = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Comment (Optional)',
                style: TextStyles.font16BlackBold.copyWith(fontSize: 14),
              ),
              const SizedBox(height: 8),
              AppTextFormField(
                controller: controller,
                maxLines: 5,
                hintText: 'Write your review here',
                hintStyle: TextStyles.font16BlackBold.copyWith(
                  fontSize: 14,
                  color: Colors.grey[500],
                ),
                contentPadding: const EdgeInsets.all(12),
              ),

              SizedBox(height: 16.h),
              SizedBox(
                width: double.infinity,
                child: AppTextButton(
                  buttonText: 'Submit',
                  textStyle: TextStyles.font16WhiteBold,
                  onPressed: () {
                    if (rating == 0) return;

                    () async {
                      if (widget.user.createReport) {
                        final userId = context.read<UserCubit>().state.user!.id;
                        updateReportCubit.emitUpdateReportStates(
                          userId: userId,
                          ratings: rating,
                        );
                      } else {
                        createReportCubit.emitCreateReportStates(rating);
                        final updatedUser = widget.user.copyWith(
                          createReport: true,
                        );
                        context.read<UserCubit>().setUser(updatedUser);
                        await saveUserDataLocally(updatedUser);
                      }

                      await Future.delayed(const Duration(milliseconds: 500));
                      widget.getFeedbacksCubit.getFeedbacks();

                      if (context.mounted) {
                        Navigator.of(context).pop(true);
                      }
                    }();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
