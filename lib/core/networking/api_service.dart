import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:universe/core/networking/api_constants.dart';
import 'package:universe/features/attended_courses/data/model/absence_percentage_response.dart';
import 'package:universe/features/chat_bot/data/model/chat_bot_request_body.dart';
import 'package:universe/features/courses_registration/data/models/available_subjects/available_subjects_response.dart';
import 'package:universe/features/courses_registration/data/models/register_subject/register_subject_request.dart';
import 'package:universe/features/courses_registration/data/models/register_subject/register_subject_response.dart';
import 'package:universe/features/courses_schedule/data/model/schedule_response.dart';
import 'package:universe/features/enrolled_courses/data/models/course_details/course_details_response.dart';
import 'package:universe/features/enrolled_courses/data/models/student_courses/student_courses_response.dart';
import 'package:universe/features/fcm/data/models/get_all_notifications/get_all_notifications_response.dart';
import 'package:universe/features/fcm/data/models/update_fcm/update_fcm_response.dart';
import 'package:universe/features/fcm/data/models/update_fcm/update_fcm_token_request_body.dart';
import 'package:universe/features/forget_password/data/models/create_new_password_model/create_new_password_request_body.dart';
import 'package:universe/features/forget_password/data/models/forget_password_model/forget_pass_request_body.dart';
import 'package:universe/features/forget_password/data/models/forget_password_model/forget_pass_response.dart';
import 'package:universe/features/forget_password/data/models/verify_password_model/verify_password_request_body.dart';
import 'package:universe/features/forget_password/data/models/verify_password_model/verify_password_response.dart';
import 'package:universe/features/home/data/models/home_data_response.dart';
import 'package:universe/features/login/data/models/login_request_body.dart';
import 'package:universe/features/login/data/models/login_response.dart';
import 'package:universe/features/scan/data/models/scan_request_body.dart';
import 'package:universe/features/scan/data/models/scan_response.dart';
import 'package:universe/features/setting/add_complaint/data/model/add_complaint_request_body.dart';
import 'package:universe/features/setting/add_complaint/data/model/add_complaint_response.dart';
import 'package:universe/features/setting/change_password/data/models/update_pass_request_body.dart';
import 'package:universe/features/setting/change_password/data/models/update_pass_response.dart';
import 'package:universe/features/setting/feedback/data/models/create_report/create_report_request_body.dart';
import 'package:universe/features/setting/feedback/data/models/create_report/create_report_response.dart';
import 'package:universe/features/setting/feedback/data/models/get_reports/get_reports_response.dart';
import 'package:universe/features/setting/feedback/data/models/update_report/update_report_request_body.dart';
import 'package:universe/features/setting/feedback/data/models/update_report/update_report_response.dart';
part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;
  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstants.forgetPassword)
  Future<ForgetPassResponse> forgetPassword(
    @Body() ForgetPassRequestBody forgetPassRequestBody,
  );

  @POST(ApiConstants.verifyPassword)
  Future<VerifyPasswordResponse> verifyPassword(
    @Body() VerifyPasswordRequestBody verifyPasswordRequestBody,
    @Header('Authorization') String token,
  );

  @PUT(ApiConstants.resetPassword)
  Future<void> createNewPassword(
    @Header('Authorization') String token,
    @Body() CreateNewPasswordRequestBody createNewPasswordRequestBody,
  );

  @GET(ApiConstants.homeData)
  Future<HomeDataResponse> getHomeData(@Header('Authorization') String token);

  @GET(ApiConstants.studentSchedule)
  Future<ScheduleResponse> getStudentSchedule({
    @Header('Authorization') required String token,
    @Query('day') String? day,
  });

  @GET(ApiConstants.studentAbsence)
  Future<AbsencePercentageResponse> getAbsencePercentage({
    @Header('Authorization') required String token,
    @Query('type') required String type,
  });

  @GET(ApiConstants.availableSubjects)
  Future<AvailableSubjectsResponse> getAvailableSubjects(
    @Header('Authorization') String token,
  );

  @POST(ApiConstants.registerSubject)
  Future<RegisterSubjectResponse> registerSubject(
    @Body() RegisterSubjectRequest registerSubjectRequest,
    @Header('Authorization') String token,
  );

  @POST(ApiConstants.scan)
  Future<ScanResponse> scan(
    @Body() ScanRequestBody scanRequestBody,
    @Header('Authorization') String token,
  );
  @POST("https://uni-ai-assistant.vercel.app/api/chat")
  Future<dynamic> sendChatMessage(
    @Body() ChatRequestBody chatRequestBody,
    @Header('Content-Type') String contentType,
  );

  @GET(ApiConstants.getStudentCourses)
  Future<StudentCoursesResponse> getStudentCourses(
    @Header('Authorization') String token,
    @Query('level') String? level,
    @Query('type') String? type,
  );
  @GET(ApiConstants.getCourseDetails)
  Future<CourseDetailsResponse> getCourseDetails(
    @Header('Authorization') String token,
    @Path('id') String id,
  );
  @PUT(ApiConstants.updatePassword)
  Future<UpdatePassResponse> updatePassword(
    @Header("Authorization") String token,
    @Body() UpdatePassRequestBody body,
  );
  @POST(ApiConstants.createReport)
  Future<CreateReportResponse> createReport(
    @Header('Authorization') String token,
    @Body() CreateReportRequestBody createReportRequestBody,
  );
  @PUT(ApiConstants.updateReport)
  Future<UpdateReportResponse> updateReport(
    @Header('Authorization') String token,
    @Body() UpdateReportRequestBody updateReportRequestBody,
  );

  @GET(ApiConstants.getFeedbacks)
  Future<ReportsResponse> getFeedbacks(@Header('Authorization') String token);

  @POST(ApiConstants.addComplaint)
  Future<AddComplaintResponse> addComplaint(
    @Header('Authorization') String token,
    @Body() AddComplaintRequestBody body,
  );
    @PUT(ApiConstants.updateFcmToken)
  Future<UpdateFcmResponse> updateFcm(
    @Header('Authorization') String token, 
    @Body() UpdateFcmTokenRequestBody body,
  );
  @GET(ApiConstants.getNotifications)
  Future<GetAllNotificationsResponse> getNotifications(
    @Header('Authorization') String token,
  );
}
