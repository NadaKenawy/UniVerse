import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universe/features/setting/feedback/data/models/get_reports/get_reports_response.dart';
import 'review_card.dart';

class FeedbacksListView extends StatelessWidget {
  const FeedbacksListView({super.key, required this.feedbacksList});
  final List<ReportItem> feedbacksList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: feedbacksList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 32.h),
          child: ReviewCard(feedbackModel: feedbacksList[index]),
        );
      },
    );
  }
}
