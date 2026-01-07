import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/colors_manager.dart';
import '../../../../core/theme/text_styles.dart';

Future<bool?> showLogoutConfirmationDialog(BuildContext context) {
  bool? result;

  return AwesomeDialog(
    context: context,
    dialogType: DialogType.question,
    animType: AnimType.bottomSlide,
    dismissOnTouchOutside: false,
    dismissOnBackKeyPress: false,
    title: 'Logout',
    titleTextStyle: TextStyles.font24PrimaryBold,
    desc: 'Are you sure you want to logout?',
    descTextStyle: TextStyles.font16BlackMedium,
    btnCancelText: 'Cancel',
    btnCancelOnPress: () {
      result = false;
    },
    btnCancelColor: ColorsManager.grey,
    buttonsTextStyle: TextStyles.font16WhiteMedium,
    btnOkColor: ColorsManager.error,

    btnOkText: 'Logout',
    btnOkOnPress: () {
      result = true;
    },
    dialogBackgroundColor: ColorsManager.white,
    borderSide: const BorderSide(color: Colors.transparent),
    dialogBorderRadius: BorderRadius.circular(16),
  ).show().then((_) => result);
}
