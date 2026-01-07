import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:universe/app/app.dart';
import 'package:universe/core/di/service_locator.dart';
import 'package:universe/features/fcm/logic/update_fcm_cubit/update_fcm_cubit.dart';
import 'package:universe/firebase_options.dart';

final Logger appLogger = Logger();

Future<void> bootstrap() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await dotenv.load(fileName: 'assets/.env');

      setupServiceLocator();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      await ScreenUtil.ensureScreenSize();

      await getIt<UpdateFcmCubit>().initializeAndSendToken();
      runApp(const UniverseApp());
    },
    (error, stack) {
      appLogger.e('Uncaught zone error', error: error, stackTrace: stack);
    },
  );
}
