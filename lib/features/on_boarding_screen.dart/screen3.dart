import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universe/core/theme/text_styles.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 32.h),
        Text(
          'Your entire university experience in one intelligent universe',
          style: TextStyles.font24PrimaryBold,
        ),
        SizedBox(height: 8.h),
        Text(
          'Manage your courses, schedules, attendance, and more — all in one intelligent platform.',
          style: TextStyles.font16BlackMedium,
        ),
        SizedBox(height: 32.h),
        SizedBox(
          height: 350.h,
          width: 350.w,
          child: Image.asset(
            'assets/images/onbording3.png',
            height: 0.35.sh,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
