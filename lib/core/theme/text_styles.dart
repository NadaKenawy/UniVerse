import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universe/core/theme/colors_manager.dart';
import 'package:universe/core/theme/font_weight_helper.dart';

class TextStyles {
  // Helper method to create text styles
  static TextStyle _createStyle({
    required double fontSize,
    required FontWeight fontWeight,
    required Color color,
  }) {
    return TextStyle(
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      color: color,
    );
  }

  // ===================== Font 24 =====================
  static TextStyle get font24BlackRegular => _createStyle(
    fontSize: 24,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.black,
  );
  static TextStyle get font24BlackMedium => _createStyle(
    fontSize: 24,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.black,
  );
  static TextStyle get font24BlackSemiBold => _createStyle(
    fontSize: 24,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.black,
  );
  static TextStyle get font24BlackBold => _createStyle(
    fontSize: 24,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.black,
  );

  static TextStyle get font24WhiteRegular => _createStyle(
    fontSize: 24,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.white,
  );
  static TextStyle get font24WhiteMedium => _createStyle(
    fontSize: 24,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.white,
  );
  static TextStyle get font24WhiteSemiBold => _createStyle(
    fontSize: 24,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.white,
  );
  static TextStyle get font24WhiteBold => _createStyle(
    fontSize: 24,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.white,
  );

  static TextStyle get font24PrimaryRegular => _createStyle(
    fontSize: 24,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.primary,
  );
  static TextStyle get font24PrimaryMedium => _createStyle(
    fontSize: 24,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.primary,
  );
  static TextStyle get font24PrimarySemiBold => _createStyle(
    fontSize: 24,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.primary,
  );
  static TextStyle get font24PrimaryBold => _createStyle(
    fontSize: 24,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.primary,
  );

  static TextStyle get font24SecondaryRegular => _createStyle(
    fontSize: 24,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.secondary,
  );
  static TextStyle get font24SecondaryMedium => _createStyle(
    fontSize: 24,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.secondary,
  );
  static TextStyle get font24SecondarySemiBold => _createStyle(
    fontSize: 24,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.secondary,
  );
  static TextStyle get font24SecondaryBold => _createStyle(
    fontSize: 24,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.secondary,
  );

  // ===================== Font 16 =====================
  static TextStyle get font16BlackRegular => _createStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.black,
  );
  static TextStyle get font16BlackMedium => _createStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.black,
  );
  static TextStyle get font16BlackSemiBold => _createStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.black,
  );
  static TextStyle get font16BlackBold => _createStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.black,
  );

  static TextStyle get font16WhiteRegular => _createStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.white,
  );
  static TextStyle get font16WhiteMedium => _createStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.white,
  );
  static TextStyle get font16WhiteSemiBold => _createStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.white,
  );
  static TextStyle get font16WhiteBold => _createStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.white,
  );

  static TextStyle get font16PrimaryRegular => _createStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.primary,
  );
  static TextStyle get font16PrimaryMedium => _createStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.primary,
  );
  static TextStyle get font16PrimarySemiBold => _createStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.primary,
  );
  static TextStyle get font16PrimaryBold => _createStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.primary,
  );

  static TextStyle get font16SecondaryRegular => _createStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.secondary,
  );
  static TextStyle get font16SecondaryMedium => _createStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.secondary,
  );
  static TextStyle get font16SecondarySemiBold => _createStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.secondary,
  );
  static TextStyle get font16SecondaryBold => _createStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.secondary,
  );

  // ===================== Font 14 =====================
  static TextStyle get font14BlackRegular => _createStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.black,
  );
  static TextStyle get font14BlackMedium => _createStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.black,
  );
  static TextStyle get font14BlackSemiBold => _createStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.black,
  );
  static TextStyle get font14BlackBold => _createStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.black,
  );

  static TextStyle get font14WhiteRegular => _createStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.white,
  );
  static TextStyle get font14WhiteMedium => _createStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.white,
  );
  static TextStyle get font14WhiteSemiBold => _createStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.white,
  );
  static TextStyle get font14WhiteBold => _createStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.white,
  );

  static TextStyle get font14PrimaryRegular => _createStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.primary,
  );
  static TextStyle get font14PrimaryMedium => _createStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.primary,
  );
  static TextStyle get font14PrimarySemiBold => _createStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.primary,
  );
  static TextStyle get font14PrimaryBold => _createStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.primary,
  );

  static TextStyle get font14SecondaryRegular => _createStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.secondary,
  );
  static TextStyle get font14SecondaryMedium => _createStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.secondary,
  );
  static TextStyle get font14SecondarySemiBold => _createStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.secondary,
  );
  static TextStyle get font14SecondaryBold => _createStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.secondary,
  );

  // ===================== Font 12 =====================
  static TextStyle get font12BlackRegular => _createStyle(
    fontSize: 12,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.black,
  );
  static TextStyle get font12BlackMedium => _createStyle(
    fontSize: 12,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.black,
  );
  static TextStyle get font12BlackSemiBold => _createStyle(
    fontSize: 12,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.black,
  );
  static TextStyle get font12BlackBold => _createStyle(
    fontSize: 12,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.black,
  );

  static TextStyle get font12WhiteRegular => _createStyle(
    fontSize: 12,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.white,
  );
  static TextStyle get font12WhiteMedium => _createStyle(
    fontSize: 12,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.white,
  );
  static TextStyle get font12WhiteSemiBold => _createStyle(
    fontSize: 12,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.white,
  );
  static TextStyle get font12WhiteBold => _createStyle(
    fontSize: 12,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.white,
  );

  static TextStyle get font12PrimaryRegular => _createStyle(
    fontSize: 12,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.primary,
  );
  static TextStyle get font12PrimaryMedium => _createStyle(
    fontSize: 12,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.primary,
  );
  static TextStyle get font12PrimarySemiBold => _createStyle(
    fontSize: 12,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.primary,
  );
  static TextStyle get font12PrimaryBold => _createStyle(
    fontSize: 12,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.primary,
  );

  static TextStyle get font12SecondaryRegular => _createStyle(
    fontSize: 12,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.secondary,
  );
  static TextStyle get font12SecondaryMedium => _createStyle(
    fontSize: 12,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.secondary,
  );
  static TextStyle get font12SecondarySemiBold => _createStyle(
    fontSize: 12,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.secondary,
  );
  static TextStyle get font12SecondaryBold => _createStyle(
    fontSize: 12,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.secondary,
  );

  // ===================== Font 10 =====================
  static TextStyle get font10BlackRegular => _createStyle(
    fontSize: 10,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.black,
  );
  static TextStyle get font10BlackMedium => _createStyle(
    fontSize: 10,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.black,
  );
  static TextStyle get font10BlackSemiBold => _createStyle(
    fontSize: 10,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.black,
  );
  static TextStyle get font10BlackBold => _createStyle(
    fontSize: 10,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.black,
  );

  static TextStyle get font10WhiteRegular => _createStyle(
    fontSize: 10,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.white,
  );
  static TextStyle get font10WhiteMedium => _createStyle(
    fontSize: 10,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.white,
  );
  static TextStyle get font10WhiteSemiBold => _createStyle(
    fontSize: 10,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.white,
  );
  static TextStyle get font10WhiteBold => _createStyle(
    fontSize: 10,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.white,
  );

  static TextStyle get font10PrimaryRegular => _createStyle(
    fontSize: 10,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.primary,
  );
  static TextStyle get font10PrimaryMedium => _createStyle(
    fontSize: 10,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.primary,
  );
  static TextStyle get font10PrimarySemiBold => _createStyle(
    fontSize: 10,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.primary,
  );
  static TextStyle get font10PrimaryBold => _createStyle(
    fontSize: 10,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.primary,
  );

  static TextStyle get font10SecondaryRegular => _createStyle(
    fontSize: 10,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.secondary,
  );
  static TextStyle get font10SecondaryMedium => _createStyle(
    fontSize: 10,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.secondary,
  );
  static TextStyle get font10SecondarySemiBold => _createStyle(
    fontSize: 10,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.secondary,
  );
  static TextStyle get font10SecondaryBold => _createStyle(
    fontSize: 10,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.secondary,
  );
}
