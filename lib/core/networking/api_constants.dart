import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String get apiBaseUrl =>
      dotenv.env['API_BASE_URL'] ?? 'https://uni-verse-rho.vercel.app';
  static const String login = "auth/login";
  static const String forgetPassword = "auth/forgetpass";
  static const String verifyPassword = "auth/verifycode";
  static const String resetPassword = "auth/resetpassword";
  static const String verifyAccount = "auth/verifyEmailUser";
  static const String homeData = "student/home";
  static const String studentSchedule = "student/schedule";
  static const String studentAbsence = "student/absencePercentage";
  static const String availableSubjects = "student/availableSubject";
  static const String registerSubject = "student/registerSubject";
  static const String scan = "student/scan";
  static const String getStudentCourses = "student/courses";
  static const String getCourseDetails = "student/courses/{id}";
  static const String updatePassword = "users/updateUserPassword";
  static const String createReport = "report";
  static const String updateReport = "report";
  static const String getFeedbacks = "report";
  static const String addComplaint = "complaint";
  static const String updateFcmToken = "auth/saveFcm";
  static const String getNotifications = "notification";
}

class ApiErrors {
  static const String badRequestError = 'Bad Request Error';
  static const String noContent = 'No Content';
  static const String forbiddenError = 'Forbidden Error';
  static const String authenticationError = 'Authentication Error';
  static const String notFoundError = 'Not Found Error';
  static const String conflictError = 'Conflict Error';
  static const String internalServerError = 'Internal Server Error';
  static const String unknownError = 'Unknown Error';
  static const String timeoutError = 'Timeout Error';
  static const String defaultError = 'Default Error';
  static const String cacheError = 'Cache Error';
  static const String noInternetError = 'No Internet Error';
  static const String loadingMessage = 'Loading_Message';
  static const String retryAgainMessage = 'Retry_Again_ Message';
  static const String unauthorizedError = 'Unauthorized Error';
  static const String ok = 'OK';
}
