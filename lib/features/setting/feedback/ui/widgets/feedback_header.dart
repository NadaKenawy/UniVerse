import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universe/core/theme/text_styles.dart';

class FeedbackHeader extends StatelessWidget {
  final String avgRating;
  final int totalReviews;

  const FeedbackHeader({
    super.key,
    required this.avgRating,
    required this.totalReviews,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.h),
        Text(
          avgRating,
          style: TextStyles.font24PrimaryBold.copyWith(fontSize: 40),
        ),
        const SizedBox(height: 4),
        RatingBarIndicator(
          rating: avgRating.isNotEmpty ? double.parse(avgRating) : 0.0,
          itemBuilder: (_, _) => const Icon(Icons.star, color: Colors.amber),
          itemCount: 5,
          itemSize: 28.0,
          unratedColor: Colors.grey[300],
        ),
        const SizedBox(height: 4),
        Text(
          ' Based on $totalReviews Reviews',
          style: TextStyles.font16BlackBold.copyWith(color: Colors.grey[600]),
        ),
        SizedBox(height: 8.h),
        Divider(color: Colors.grey[300], thickness: 1),
      ],
    );
  }
}
