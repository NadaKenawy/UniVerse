import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:universe/app/router.dart';
import 'package:universe/core/theme/colors_manager.dart';
import 'package:universe/core/theme/text_styles.dart';
import 'package:universe/features/setting/ui/widgets/setting_item.dart';
import '../../../../core/constants/shared_pref_helper.dart';
import '../../../../core/constants/shared_pref_keys.dart';
import 'show_logout_confirmation_dialog.dart';

class SettingScreenBody extends StatelessWidget {
  const SettingScreenBody({super.key});

  Future<void> _logout(BuildContext context) async {
    await SharedPrefHelper.removeSecuredData(SharedPrefKeys.userToken);
    if (context.mounted) {
      GoRouter.of(context).go(AppRouter.kLoginScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64.h,
        title: Text(
          'Settings',
          style: TextStyles.font24WhiteBold.copyWith(fontSize: 20.sp),
        ),
        backgroundColor: ColorsManager.primary,
        iconTheme: IconThemeData(color: Colors.white, size: 24.sp),
      ),
      body: Column(
        children: [
          SizedBox(height: 16.h),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0).copyWith(top: 0),
              children: [
                SettingItem(
                  icon: Icons.help_outline,
                  title: 'FAQs',
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kFaqScreen);
                  },
                ),
                Divider(color: Colors.grey[200], thickness: 1),
                SettingItem(
                  icon: Icons.support_agent,
                  title: 'Support Contact',
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kSupportContactScreen);
                  },
                ),
                Divider(color: Colors.grey[200], thickness: 1),
                SettingItem(
                  icon: Icons.people_outline,
                  title: 'Feedbacks',
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kFeedbackScreen);
                  },
                ),
                Divider(color: Colors.grey[200], thickness: 1),
                SettingItem(
                  icon: Icons.lock_outline,
                  title: 'Change Password',
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kChangePasswordScreen);
                  },
                ),
                Divider(color: Colors.grey[200], thickness: 1),
                SettingItem(
                  icon: Icons.logout,
                  title: 'Logout',
                  iconColor: Colors.red,
                  textColor: Colors.red,
                  onTap: () async {
                    final bool? shouldLogout =
                        await showLogoutConfirmationDialog(context);

                    if (shouldLogout == true && context.mounted) {
                      await _logout(context);
                    }
                  },
                ),
                const Divider(color: Colors.red, thickness: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
