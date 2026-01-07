import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:universe/app/router.dart';
import 'package:universe/core/constants/user_cubit.dart';
import 'package:universe/core/di/service_locator.dart';
import 'package:universe/core/theme/colors_manager.dart';

class UniverseApp extends StatefulWidget {
  const UniverseApp({super.key});

  @override
  State<UniverseApp> createState() => _UniverseAppState();
}

class _UniverseAppState extends State<UniverseApp> {
  late final StreamSubscription _userSubscription;

  @override
  void initState() {
    super.initState();
    _initializeLocationUpdates();
  }

  void _initializeLocationUpdates() {
    try {
      final userCubit = getIt<UserCubit>();

      _userSubscription = userCubit.stream.listen((userState) {
        if (userState.user != null) {
          log('User is logged in: ${userState.user}');
        } else {
          log('No user logged in');
        }
      });
    } catch (e, stackTrace) {
      log('Error initializing user updates: $e', stackTrace: stackTrace);
    }
  }

  @override
  void dispose() {
    _userSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UserCubit>(),
      child: ScreenUtilInit(
        designSize: const Size(411.4, 843.4),
        ensureScreenSize: true,
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
          themeMode: ThemeMode.system,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: ColorsManager.primary),
            textTheme: GoogleFonts.poppinsTextTheme(),
            useMaterial3: true,
          ),
          supportedLocales: const [Locale('en'), Locale('ar')],
          locale: const Locale('en'),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        ),
      ),
    );
  }
}
