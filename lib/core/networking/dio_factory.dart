import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:universe/core/constants/app_constants.dart';

class DioFactory {
  DioFactory._();
  static Dio? dio;

  static Dio getDio() {
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = AppConstants.connectionTimeout
        ..options.receiveTimeout = AppConstants.receiveTimeout;
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }

  static void setTokenIntoHeaderAfterSignUp(String token) {
    dio?.options.headers = {'Authorization': 'Bearer $token'};
  }
}
