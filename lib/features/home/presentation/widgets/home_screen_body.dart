import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universe/core/theme/colors_manager.dart';
import 'package:universe/features/chat_bot/ui/chat_bot_screen.dart';
import 'package:universe/features/profile/profile_screen.dart';
import 'package:universe/features/scan/presentation/scan_screen.dart';
import 'package:universe/features/setting/ui/setting_screen.dart';
import '../widgets/dashboard_view.dart';
import '../widgets/custom_bottom_bar.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  int currentIndex = 0;

  final pages = const [
    DashboardView(),
    ChatBotScreen(),
    ScanScreen(),
    ProfileScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final keyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: IndexedStack(index: currentIndex, children: pages),

      floatingActionButton: keyboardVisible
          ? null
          : Container(
              width: 72.w,
              height: 72.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 4.w),
              ),
              child: Container(
                width: 60.sp,
                height: 60.sp,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [ColorsManager.primary, ColorsManager.secondary],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Material(
                  color: Colors.transparent,
                  shape: const CircleBorder(),
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () {
                      setState(() => currentIndex = 2);
                    },
                    child: Center(
                      child: Icon(
                        Icons.qr_code_scanner,
                        size: 30.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: keyboardVisible
          ? null
          : CustomBottomBar(
              currentIndex: currentIndex,
              onTap: (index) {
                setState(() => currentIndex = index);
              },
            ),
    );
  }
}
