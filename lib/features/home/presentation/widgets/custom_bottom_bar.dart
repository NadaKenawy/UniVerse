import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universe/core/theme/colors_manager.dart';
import 'package:universe/core/theme/text_styles.dart';

class CustomBottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 92.h,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _item(Icons.home, 'Home', 0),
            _item(Icons.smart_toy_outlined, 'Chatbot', 1),
            SizedBox(width: 40.w),
            _item(Icons.person_outline, 'Profile', 3),
            _item(Icons.settings_outlined, 'Settings', 4),
          ],
        ),
      ),
    );
  }

  Widget _item(IconData icon, String label, int index) {
    final active = currentIndex == index;
    return InkWell(
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: active ? ColorsManager.primary : ColorsManager.darkGrey,
            size: 28.sp,
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyles.font12BlackSemiBold.copyWith(
              color: active ? ColorsManager.primary : ColorsManager.darkGrey,
            ),
          ),
        ],
      ),
    );
  }
}
