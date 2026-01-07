import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universe/core/theme/colors_manager.dart';

class PercentageProgressBar extends StatelessWidget {
  final double percentage;
  final double height;
  final Color? progressColor;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final bool showPercentageText;
  final bool invertPercentage;

  const PercentageProgressBar({
    super.key,
    required this.percentage,
    this.height = 10,
    this.progressColor,
    this.backgroundColor,
    this.borderRadius,
    this.showPercentageText = false,
    this.invertPercentage = false,
  });

  @override
  Widget build(BuildContext context) {
    final double displayPercentage = invertPercentage
        ? (100 - percentage).clamp(0, 100)
        : percentage.clamp(0, 100);

    final double normalizedValue = displayPercentage / 100;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.circular(8.r),
          child: Container(
            height: height.h,
            width: double.infinity,
            color: backgroundColor ?? ColorsManager.lightGrey,
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: normalizedValue,
              child: Container(
                decoration: BoxDecoration(
                  color: progressColor ?? ColorsManager.primary,
                  borderRadius: borderRadius ?? BorderRadius.circular(8.r),
                ),
              ),
            ),
          ),
        ),
        if (showPercentageText) ...[
          SizedBox(height: 6.h),
          Text(
            '${displayPercentage.toInt()}%',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
        ],
      ],
    );
  }
}
