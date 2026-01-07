import 'package:dio/dio.dart';

abstract class Failure {
  final String errmessage;

  Failure({required this.errmessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errmessage});

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errmessage: 'Connection Timeout');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errmessage: 'Send Timeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errmessage: 'Receive Timeout');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          e.response!.statusCode!,
          e.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(errmessage: 'Request Cancelled');
      case DioExceptionType.unknown:
        if (e.message!.contains('SocketException')) {
          return ServerFailure(errmessage: 'No Internet Connection');
        } else {
          return ServerFailure(errmessage: 'Unknown Error, please try later');
        }
      default:
        return ServerFailure(errmessage: 'No Internet Connection');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (response == null) {
      return ServerFailure(errmessage: 'An Error Occurred, please try later');
    }

    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(
        errmessage:
            response['message'] ??
            response['error']?[0]?['msg'] ??
            'Unknown Error',
      );
    } else if (statusCode == 404) {
      return ServerFailure(
        errmessage: response['message'] ?? 'Resource Not Found',
      );
    } else if (statusCode == 500) {
      return ServerFailure(errmessage: 'Internal Server Error');
    } else {
      return ServerFailure(errmessage: 'An Error Occurred, please try later');
    }
  }
}

class ServerErrorHandler implements Exception {
  late ServerFailure serverFailure;

  ServerErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      serverFailure = _handleError(error);
    } else if (error.toString().contains('type') || 
               error.toString().contains('FormatException') ||
               error.toString().contains('json')) {
      serverFailure = ServerFailure(
        errmessage: 'Error parsing response data. Please try again.',
      );
    } else {
      serverFailure = ServerFailure(
        errmessage: 'Unknown Error: ${error.toString()}',
      );
    }
  }

  ServerFailure _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errmessage: 'Connection Timeout');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errmessage: 'Send Timeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errmessage: 'Receive Timeout');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          error.response!.statusCode!,
          error.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(errmessage: 'Request Cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure(errmessage: 'No Internet Connection');
      default:
        return ServerFailure(errmessage: 'Unknown Error');
    }
  }
}
