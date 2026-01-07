import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universe/core/theme/colors_manager.dart';
import 'package:universe/core/theme/text_styles.dart';
import 'package:universe/features/courses_schedule/presentation/widgets/course_models.dart';

class SelectScheduleCard extends StatelessWidget {
  final List<DayItem> days;
  final int selectedIndex;
  final ValueChanged<int> onDayTap;

  const SelectScheduleCard({
    super.key,
    required this.days,
    required this.selectedIndex,
    required this.onDayTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Schedule',
            style: TextStyles.font16BlackSemiBold.copyWith(
              color: ColorsManager.darkGrey,
            ),
          ),
          SizedBox(height: 12.h),
          SizedBox(
            height: 80.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: days.length,
              separatorBuilder: (_, _) => SizedBox(width: 10.w),
              itemBuilder: (context, idx) {
                final d = days[idx];
                final bool selected = idx == selectedIndex;
                return GestureDetector(
                  onTap: () => onDayTap(idx),
                  child: Container(
                    width: 62.w,
                    padding: EdgeInsets.symmetric(
                      vertical: 8.h,
                      horizontal: 6.w,
                    ),
                    decoration: BoxDecoration(
                      color: selected ? ColorsManager.primary : Colors.white,
                      borderRadius: BorderRadius.circular(25.r),
                      border: Border.all(
                        color: selected
                            ? Colors.transparent
                            : ColorsManager.grey.withValues(alpha: 0.5),
                        width: 1.w,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          d.dayNumber,
                          style: TextStyles.font16BlackBold.copyWith(
                            color: selected ? Colors.white : Colors.black,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          d.dayLabel,
                          style: TextStyles.font14BlackBold.copyWith(
                            color: selected ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
