import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universe/core/constants/user_cubit.dart';
import 'package:universe/core/theme/colors_manager.dart';
import 'package:universe/core/theme/text_styles.dart';
import 'package:universe/core/widgets/custom_button.dart';
import 'package:universe/features/setting/feedback/data/models/get_reports/get_reports_response.dart';
import 'package:universe/features/setting/feedback/logic/get_reports_cubit/get_reports_cubit.dart';
import '../../logic/create_report_cubit/create_report_cubit.dart';
import '../../logic/update_report_cubit/update_report_cubit.dart';
import 'feedback_header.dart';
import 'feedbacks_list_view.dart';
import 'write_review_dialog.dart';

class FeedbackScreenBody extends StatefulWidget {
  const FeedbackScreenBody({super.key, required this.getFeedbacksResponse});
  final ReportsResponse getFeedbacksResponse;

  @override
  State<FeedbackScreenBody> createState() => _FeedbackScreenBodyState();
}

class _FeedbackScreenBodyState extends State<FeedbackScreenBody> {
  void showThankYouDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white.withValues(alpha: 0.9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            Text("Thank you", style: TextStyles.font24PrimaryBold),
            const SizedBox(width: 8),
            const Icon(Icons.favorite, color: ColorsManager.primary),
          ],
        ),
        content: Text(
          "We appreciate your feedback",
          style: TextStyles.font16BlackBold,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Close",
              style: TextStyles.font24PrimaryBold.copyWith(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  void showReviewDialog() async {
    final user = context.read<UserCubit>().state.user;
    if (user == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please login first')));
      return;
    }

    final createReportCubit = context.read<CreateReportCubit>();
    final updateReportCubit = context.read<UpdateReportCubit>();
    final getFeedbacksCubit = context.read<GetReportsCubit>();

    final success = await showDialog<bool>(
      context: context,
      builder: (context) => WriteReviewDialog(
        user: user,
        createReportCubit: createReportCubit,
        updateReportCubit: updateReportCubit,
        getFeedbacksCubit: getFeedbacksCubit,
      ),
    );
    if (success == true) {
      showThankYouDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SizedBox(height: 8),
          FeedbackHeader(
            avgRating: widget.getFeedbacksResponse.stats.averageRating
                .toString(),
            totalReviews: widget.getFeedbacksResponse.stats.totalReports,
          ),
          FeedbacksListView(feedbacksList: widget.getFeedbacksResponse.reports),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: AppTextButton(
              buttonText: 'Write a Review',
              textStyle: TextStyles.font16WhiteBold,
              onPressed: showReviewDialog,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class FeedbackScreenBodySkeleton extends StatelessWidget {
  const FeedbackScreenBodySkeleton({
    super.key,
    required this.avgRating,
    required this.totalReviews,
  });

  final double avgRating;
  final int totalReviews;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SizedBox(height: 8),
          FeedbackHeader(
            avgRating: avgRating.toString(),
            totalReviews: totalReviews,
          ),
          const FeedbacksListViewSkeleton(),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class FeedbacksListViewSkeleton extends StatelessWidget {
  const FeedbacksListViewSkeleton({super.key, this.itemCount = 4});
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: itemCount,
      separatorBuilder: (_, _) => const SizedBox(height: 32),
      itemBuilder: (context, index) => const ReviewCardSkeleton(),
    );
  }
}

class ReviewCardSkeleton extends StatelessWidget {
  const ReviewCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: List.generate(
                      5,
                      (index) => Container(
                        width: 18,
                        height: 18,
                        margin: const EdgeInsets.symmetric(horizontal: 1),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 60,
              height: 14,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 16,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
  }
}
