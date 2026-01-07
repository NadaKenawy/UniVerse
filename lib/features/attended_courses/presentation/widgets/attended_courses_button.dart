import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universe/core/theme/colors_manager.dart';
import 'package:universe/core/theme/text_styles.dart';

class AttendedCoursesButton extends StatelessWidget {
  final ValueChanged<int> onToggle;
  final int selectedIndex;
  const AttendedCoursesButton({
    super.key,
    required this.onToggle,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 380.w,
        height: 48.h,
        decoration: BoxDecoration(
          color: ColorsManager.lightGrey,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            _buildSegment("Doctor", 0),
            _buildSegment("Teaching Assistant", 1),
          ],
        ),
      ),
    );
  }

  Widget _buildSegment(String text, int index) {
    bool isSelected = selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => onToggle(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: isSelected ? ColorsManager.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(30),
          ),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            text,
            style: TextStyles.font16WhiteSemiBold.copyWith(
              color: isSelected ? Colors.white : ColorsManager.primary,
            ),
          ),
        ),
      ),
    );
  }
}
