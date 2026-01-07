import 'package:get_it/get_it.dart';
import 'package:universe/core/constants/user_cubit.dart';
import 'package:universe/core/networking/api_constants.dart';
import 'package:universe/core/networking/api_service.dart';
import 'package:universe/core/networking/dio_factory.dart';
import 'package:universe/features/attended_courses/data/repo/absence_repo.dart';
import 'package:universe/features/attended_courses/logic/absence_cubit.dart';
import 'package:universe/features/chat_bot/data/repo/chat_bot_repo.dart';
import 'package:universe/features/chat_bot/logic/chat_bot_cubit.dart';
import 'package:universe/features/courses_registration/data/repos/available_subjects_repo.dart';
import 'package:universe/features/courses_registration/data/repos/register_subject_repo.dart';
import 'package:universe/features/courses_registration/logic/available_subjects/available_subjects_cubit.dart';
import 'package:universe/features/courses_registration/logic/register_subject/register_subject_cubit.dart';
import 'package:universe/features/courses_schedule/data/repo/schedule_repo.dart';
import 'package:universe/features/courses_schedule/logic/schedule_cubit.dart';
import 'package:universe/features/enrolled_courses/data/repos/course_details_repo.dart';
import 'package:universe/features/enrolled_courses/data/repos/student_courses_repo.dart';
import 'package:universe/features/enrolled_courses/logic/course_details/course_details_cubit.dart';
import 'package:universe/features/enrolled_courses/logic/student_courses/student_courses_cubit.dart';
import 'package:universe/features/fcm/data/repos/get_all_notifications_repo.dart';
import 'package:universe/features/fcm/logic/get_all_notifications_cubit/get_all_notifications_cubit.dart';
import 'package:universe/features/forget_password/data/repos/create_new_password.dart';
import 'package:universe/features/forget_password/data/repos/forget_pass_repo.dart';
import 'package:universe/features/forget_password/data/repos/verify_password_repo.dart';
import 'package:universe/features/forget_password/logic/create_new_password_cubit/create_new_password_cubit.dart';
import 'package:universe/features/forget_password/logic/forget_password_cubit/forget_password_cubit.dart';
import 'package:universe/features/forget_password/logic/verify_password_cubit/verify_password_cubit.dart';
import 'package:universe/features/home/data/repos/home_repo.dart';
import 'package:universe/features/home/logic/home_cubit.dart';
import 'package:universe/features/login/data/repos/login_repo.dart';
import 'package:universe/features/login/logic/login_cubit.dart';
import 'package:universe/features/scan/data/repos/scan_repo.dart';
import 'package:universe/features/scan/logic/scan_cubit.dart';
import 'package:universe/features/setting/add_complaint/data/repo/complaint_repo.dart';
import 'package:universe/features/setting/add_complaint/logic/complaint_cubit.dart';
import 'package:universe/features/setting/change_password/data/repo/update_pass_repo.dart';
import 'package:universe/features/setting/change_password/logic/update_pass_cubit.dart';
import 'package:universe/features/setting/feedback/data/repo/create_report_repo.dart';
import 'package:universe/features/setting/feedback/data/repo/get_reports_repo.dart';
import 'package:universe/features/setting/feedback/data/repo/update_report_repo.dart';
import 'package:universe/features/setting/feedback/logic/create_report_cubit/create_report_cubit.dart';
import 'package:universe/features/setting/feedback/logic/get_reports_cubit/get_reports_cubit.dart';
import 'package:universe/features/setting/feedback/logic/update_report_cubit/update_report_cubit.dart';
import 'package:universe/features/fcm/data/repos/update_fcm_repo.dart';
import 'package:universe/features/fcm/logic/update_fcm_cubit/update_fcm_cubit.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton(() => DioFactory.getDio());

  getIt.registerLazySingleton<ApiService>(
    () => ApiService(getIt(), baseUrl: ApiConstants.apiBaseUrl),
  );
  // User Cubit - Singleton to maintain user state across the app
  getIt.registerLazySingleton<UserCubit>(() => UserCubit());

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(getIt(), getIt<UserCubit>()),
  );
  // forget password
  getIt.registerLazySingleton<ForgetPassRepo>(() => ForgetPassRepo(getIt()));
  getIt.registerFactory<ForgetPasswordCubit>(
    () => ForgetPasswordCubit(getIt()),
  );

  // verify password
  getIt.registerLazySingleton<VerifyPasswordRepo>(
    () => VerifyPasswordRepo(getIt()),
  );
  getIt.registerFactory<VerifyPasswordCubit>(
    () => VerifyPasswordCubit(getIt()),
  );

  // create new password
  getIt.registerLazySingleton<CreateNewPasswordRepo>(
    () => CreateNewPasswordRepo(getIt()),
  );
  getIt.registerFactory<CreateNewPasswordCubit>(
    () => CreateNewPasswordCubit(getIt()),
  );

  // home data
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));

  // student schedule
  getIt.registerLazySingleton<ScheduleRepo>(() => ScheduleRepo(getIt()));
  getIt.registerFactory<ScheduleCubit>(() => ScheduleCubit(getIt()));

  // student absence
  getIt.registerLazySingleton<AbsenceRepo>(() => AbsenceRepo(getIt()));
  getIt.registerFactory<AbsenceCubit>(() => AbsenceCubit(getIt()));

  // available subject
  getIt.registerLazySingleton<AvailableSubjectsRepo>(
    () => AvailableSubjectsRepo(getIt()),
  );
  getIt.registerFactory<AvailableSubjectsCubit>(
    () => AvailableSubjectsCubit(getIt()),
  );

  // register subject
  getIt.registerLazySingleton<RegisterSubjectRepo>(
    () => RegisterSubjectRepo(getIt()),
  );
  getIt.registerFactory<RegisterSubjectCubit>(
    () => RegisterSubjectCubit(getIt()),
  );

  // scan
  getIt.registerLazySingleton<ScanRepo>(() => ScanRepo(getIt()));
  getIt.registerFactory<ScanCubit>(() => ScanCubit(getIt()));

  // chat bot
  getIt.registerLazySingleton<ChatRepo>(() => ChatRepo(getIt()));
  getIt.registerFactory<ChatCubit>(() => ChatCubit(getIt()));

  // student courses
  getIt.registerLazySingleton<StudentCoursesRepo>(
    () => StudentCoursesRepo(getIt()),
  );
  getIt.registerFactory<StudentCoursesCubit>(
    () => StudentCoursesCubit(getIt()),
  );

  // course details
  getIt.registerLazySingleton<CourseDetailsRepo>(
    () => CourseDetailsRepo(getIt()),
  );
  getIt.registerFactory<CourseDetailsCubit>(() => CourseDetailsCubit(getIt()));
  // update password
  getIt.registerLazySingleton<UpdatePassRepo>(() => UpdatePassRepo(getIt()));
  getIt.registerFactory<UpdatePassCubit>(() => UpdatePassCubit(getIt()));

  // get reports (feedback)
  getIt.registerLazySingleton<GetReportsRepo>(() => GetReportsRepo(getIt()));
  getIt.registerFactory<GetReportsCubit>(() => GetReportsCubit(getIt()));

  // create report (feedback)
  getIt.registerLazySingleton<CreateReportRepo>(
    () => CreateReportRepo(getIt()),
  );
  getIt.registerFactory<CreateReportCubit>(() => CreateReportCubit(getIt()));

  // update report (feedback)
  getIt.registerLazySingleton<UpdateReportRepo>(
    () => UpdateReportRepo(getIt()),
  );
  getIt.registerFactory<UpdateReportCubit>(() => UpdateReportCubit(getIt()));

  // add complaint
  getIt.registerLazySingleton<ComplaintRepo>(() => ComplaintRepo(getIt()));
  getIt.registerFactory<ComplaintCubit>(() => ComplaintCubit(getIt()));

  // FCM
  getIt.registerLazySingleton<UpdateFcmRepo>(() => UpdateFcmRepo(getIt()));
  getIt.registerFactory<UpdateFcmCubit>(() => UpdateFcmCubit(getIt()));

  // get notifications
  getIt.registerLazySingleton<GetAllNotificationsRepo>(
    () => GetAllNotificationsRepo(getIt()),
  );
  getIt.registerFactory<GetAllNotificationsCubit>(
    () => GetAllNotificationsCubit(getIt()),
  );
}
