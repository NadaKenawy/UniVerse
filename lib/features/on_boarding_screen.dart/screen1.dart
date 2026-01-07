import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universe/core/theme/text_styles.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 32.h),
        Text(
          'Easy Attendance Tracking, Quick and Reliable',
          style: TextStyles.font24PrimaryBold,
        ),
        SizedBox(height: 8.h),
        Text(
          'Keep your attendance up-to-date easily and reliably, so you never miss a class.',
          style: TextStyles.font16BlackMedium,
        ),
        SizedBox(height: 32.h),
        SizedBox(
          height: 350.h,
          width: 350.w,
          child: Image.asset(
            'assets/images/onbording1.png',
            height: 0.35.sh,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
