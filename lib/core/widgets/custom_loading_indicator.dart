import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universe/core/theme/colors_manager.dart';

class CustomLoadingIndicator extends StatelessWidget {
  final Color? color;
  final double? size;

  const CustomLoadingIndicator({super.key, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size?.w ?? 30.w,
      height: size?.h ?? 30.h,
      child: CircularProgressIndicator(
        color: color ?? ColorsManager.primary,
        strokeWidth: 3,
      ),
    );
  }
}
