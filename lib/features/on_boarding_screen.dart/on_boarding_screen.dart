import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:universe/app/router.dart';
import 'package:universe/core/constants/shared_pref_helper.dart';
import 'package:universe/core/constants/shared_pref_keys.dart';
import 'package:universe/core/constants/user_cubit.dart';
import 'package:universe/core/di/service_locator.dart';
import 'package:universe/core/theme/colors_manager.dart';
import 'package:universe/core/theme/text_styles.dart';
import 'package:universe/features/on_boarding_screen.dart/screen1.dart';
import 'package:universe/features/on_boarding_screen.dart/screen2.dart';
import 'package:universe/features/on_boarding_screen.dart/screen3.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkFirstTimeOpen();
  }

  Future<void> _checkFirstTimeOpen() async {
    final userCubit = getIt<UserCubit>();
    final prefs = await SharedPreferences.getInstance();
    final hasOpenedBefore = prefs.getBool('hasOpenedBefore') ?? false;

    if (hasOpenedBefore) {
      final token = await SharedPrefHelper.getSecuredString(
        SharedPrefKeys.userToken,
      );

      if (token.isEmpty) {
        if (!mounted) return;
        GoRouter.of(context).pushReplacement(AppRouter.kLoginScreen);
        return;
      }

      while (userCubit.state.isLoading || userCubit.state.user == null) {
        await Future.delayed(const Duration(milliseconds: 200));
        if (!mounted) return;
      }

      if (!mounted) return;
      GoRouter.of(context).pushReplacement(AppRouter.kHomeScreen);
    } else {
      await prefs.setBool('hasOpenedBefore', true);
      if (!mounted) return;
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() => _currentIndex = index);
                  },
                  children: const [Screen1(), Screen2(), Screen3()],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SmoothPageIndicator(
                          controller: _pageController,
                          count: 3,
                          effect: WormEffect(
                            dotHeight: 10.r,
                            dotWidth: 10.r,
                            activeDotColor: ColorsManager.primary,
                            dotColor: ColorsManager.lightGrey,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            if (!mounted) return;
                            GoRouter.of(
                              context,
                            ).pushReplacement(AppRouter.kLoginScreen);
                          },
                          child: Text(
                            'Skip',
                            style: TextStyles.font24PrimaryBold.copyWith(
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 70.w,
                      height: 70.h,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 70.w,
                            height: 70.h,
                            child: CircularProgressIndicator(
                              value:
                                  (_currentIndex + 1) /
                                  3, // عدد صفحات onboarding
                              strokeWidth: 3,
                              backgroundColor: Colors.grey.shade300,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                ColorsManager.primary,
                              ),
                            ),
                          ),

                          // الزر نفسه
                          Container(
                            width: 56.w,
                            height: 56.h,
                            decoration: const BoxDecoration(
                              color: ColorsManager.primary,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: Icon(
                                _currentIndex == 2
                                    ? Icons.check
                                    : Icons.arrow_forward,
                                color: Colors.white,
                                size: 24.sp,
                              ),
                              onPressed: () {
                                if (_currentIndex < 2) {
                                  _pageController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                } else {
                                  GoRouter.of(
                                    context,
                                  ).pushReplacement(AppRouter.kLoginScreen);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
