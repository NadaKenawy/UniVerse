import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:universe/app/router.dart';
import 'package:universe/core/theme/text_styles.dart';
import 'package:universe/core/widgets/custom_button.dart';

class ScanSuccessScreenBody extends StatelessWidget {
  const ScanSuccessScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/scan_succesful.png'),
            Text(
              'Attendance Recorded Successfully!',
              style: TextStyles.font24PrimaryBold,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            SizedBox(
              width: double.infinity,
              child: AppTextButton(
                onPressed: () {
                  context.go(AppRouter.kHomeScreen);
                },

                buttonText: 'Back to Home',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
