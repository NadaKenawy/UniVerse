import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  static String get appName => dotenv.env['APP_NAME'] ?? 'Flutter App';
  static String get appVersion => dotenv.env['APP_VERSION'] ?? '1.0.0';

  // App settings
  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
}

