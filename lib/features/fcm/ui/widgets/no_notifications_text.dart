import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universe/core/theme/text_styles.dart';

class NoNotificationsText extends StatelessWidget {
  const NoNotificationsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/mail.png', width: 100.w),
          SizedBox(height: 24.h),
          Text(
            'There are no notifications yet',
            textAlign: TextAlign.center,
            style: TextStyles.font24BlackBold,
          ),
          SizedBox(height: 120.h),
        ],
      ),
    );
  }
}
