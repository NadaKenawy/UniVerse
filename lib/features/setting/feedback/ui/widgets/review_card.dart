import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universe/core/theme/text_styles.dart';
import 'package:universe/features/setting/feedback/data/models/get_reports/get_reports_response.dart';

class ReviewCard extends StatelessWidget {
  final ReportItem feedbackModel;

  const ReviewCard({super.key, required this.feedbackModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
                    backgroundImage: NetworkImage(
                      feedbackModel.user.profileImage,
                    ),
                    radius: 22,
                  ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    feedbackModel.user.name,
                    style: TextStyles.font16BlackBold,
                  ),
                  Row(
                    children: [
                      RatingBarIndicator(
                        rating: feedbackModel.ratings.toDouble(),
                        itemBuilder: (_, _) =>
                            const Icon(Icons.star, color: Colors.amber),
                        itemCount: 5,
                        itemSize: 18,
                        unratedColor: Colors.grey[300],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        feedbackModel.ratings.toStringAsFixed(1),
                        style: TextStyles.font16BlackBold,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              feedbackModel.createdAt.split('T')[0],
              style: TextStyles.font12BlackBold.copyWith(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Text(
          feedbackModel.title,
          style: TextStyles.font16BlackBold.copyWith(color: Colors.grey[700]),
        ),
      ],
    );
  }
}
