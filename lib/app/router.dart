import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:universe/core/di/service_locator.dart';
import 'package:universe/features/attended_courses/logic/absence_cubit.dart';
import 'package:universe/features/attended_courses/presentation/attended_courses_screen.dart';
import 'package:universe/features/chat_bot/ui/chat_bot_screen.dart';
import 'package:universe/features/courses_registration/data/models/available_subjects/available_subjects_response.dart';
import 'package:universe/features/courses_registration/presentation/course_details_screen.dart'
    as registration;
import 'package:universe/features/enrolled_courses/data/models/student_courses/student_courses_response.dart';
import 'package:universe/features/enrolled_courses/presentation/course_details_screen.dart';
import 'package:universe/features/courses_registration/presentation/courses_registration_screen.dart';
import 'package:universe/features/courses_registration/logic/available_subjects/available_subjects_cubit.dart';
import 'package:universe/features/courses_registration/logic/register_subject/register_subject_cubit.dart';
import 'package:universe/features/courses_schedule/logic/schedule_cubit.dart';
import 'package:universe/features/courses_schedule/presentation/courses_schedule_screen.dart';
import 'package:universe/features/enrolled_courses/logic/course_details/course_details_cubit.dart';
import 'package:universe/features/enrolled_courses/logic/student_courses/student_courses_cubit.dart';
import 'package:universe/features/enrolled_courses/presentation/enrolled_courses_screen.dart';
import 'package:universe/features/fcm/logic/get_all_notifications_cubit/get_all_notifications_cubit.dart';
import 'package:universe/features/fcm/ui/notifications_screen.dart';
import 'package:universe/features/forget_password/presentation/create_new_password_screen.dart';
import 'package:universe/features/forget_password/presentation/forget_pass_screen.dart';
import 'package:universe/features/forget_password/presentation/verify_password_screen.dart';
import 'package:universe/features/home/logic/home_cubit.dart';
import 'package:universe/features/home/presentation/home_screen.dart';
import 'package:universe/features/login/presentation/login_screen.dart';
import 'package:universe/features/on_boarding_screen.dart/on_boarding_screen.dart';
import 'package:universe/features/profile/profile_screen.dart';
import 'package:universe/features/scan/presentation/scan_screen.dart';
import 'package:universe/features/scan/presentation/scan_success_screen.dart';
import 'package:universe/features/setting/change_password/logic/update_pass_cubit.dart';
import 'package:universe/features/setting/change_password/ui/change_password_screen.dart';
import 'package:universe/features/setting/feedback/logic/create_report_cubit/create_report_cubit.dart';
import 'package:universe/features/setting/feedback/logic/get_reports_cubit/get_reports_cubit.dart';
import 'package:universe/features/setting/feedback/logic/update_report_cubit/update_report_cubit.dart';
import 'package:universe/features/setting/feedback/ui/feedback_screen.dart';
import 'package:universe/features/setting/ui/faq_screen.dart';
import 'package:universe/features/setting/ui/setting_screen.dart';
import 'package:universe/features/setting/add_complaint/presentation/support_contact_screen.dart';

abstract class AppRouter {
  static const kLoginScreen = '/loginScreen';
  static const kOnBoardingScreen = '/';
  static const kHomeScreen = '/homeScreen';
  static const kForgetPassScreen = '/forgetPassScreen';
  static const kVerifyPasswordScreen = '/verifyPasswordScreen';
  static const kCreateNewPasswordScreen = '/createNewPasswordScreen';
  static const kCoursesScheduleScreen = '/coursesScheduleScreen';
  static const kAttendedCoursesScreen = '/attendedCoursesScreen';
  static const kCoursesRegistrationScreen = '/coursesRegistrationScreen';
  static const kCourseDetailsScreen = '/courseDetailsScreen';
  static const kScanScreen = '/scanScreen';
  static const kScanSuccessScreen = '/scanSuccessScreen';
  static const kProfileScreen = '/profileScreen';
  static const kChatBotScreen = '/chatBotScreen';
  static const kEnrolledCoursesScreen = '/enrolledCoursesScreen';
  static const kCourseDetailsScreenWithParam = '/courseDetailsScreen';
  static const kSettingScreen = '/settingScreen';
  static const kFaqScreen = '/faqScreen';
  static const kSupportContactScreen = '/supportContactScreen';
  static const kFeedbackScreen = '/feedbackScreen';
  static const kChangePasswordScreen = '/changePasswordScreen';
  static const kNotificationsScreen = '/notificationScreen';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kOnBoardingScreen,
        builder: (context, state) {
          return const OnBoardingScreen();
        },
      ),
      GoRoute(
        path: kLoginScreen,
        builder: (context, state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: kHomeScreen,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => getIt<HomeCubit>(),
            child: const HomeScreen(),
          );
        },
      ),

      GoRoute(
        path: AppRouter.kForgetPassScreen,
        builder: (context, state) {
          return const ForgetPassScreen();
        },
      ),
      GoRoute(
        path: kVerifyPasswordScreen,
        builder: (context, state) {
          return const VerifyPasswordScreen();
        },
      ),
      GoRoute(
        path: kCreateNewPasswordScreen,
        builder: (context, state) {
          return const CreateNewPasswordScreen();
        },
      ),
      GoRoute(
        path: kCoursesScheduleScreen,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => getIt<ScheduleCubit>(),
            child: const CoursesScheduleScreen(),
          );
        },
      ),
      GoRoute(
        path: kAttendedCoursesScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<AbsenceCubit>(),
          child: const AttendedCoursesScreen(),
        ),
      ),

      GoRoute(
        path: kCoursesRegistrationScreen,
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<AvailableSubjectsCubit>(),
              ),
              BlocProvider(create: (context) => getIt<RegisterSubjectCubit>()),
            ],
            child: const CoursesRegistrationScreen(),
          );
        },
      ),

      GoRoute(
        path: kCourseDetailsScreen,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => getIt<RegisterSubjectCubit>(),
            child: registration.CourseDetailsScreen(
              subjectData: state.extra as AvailableSubjectData,
            ),
          );
        },
      ),

      GoRoute(
        path: kScanScreen,
        builder: (context, state) {
          return const ScanScreen();
        },
      ),

      GoRoute(
        path: kScanSuccessScreen,
        builder: (context, state) {
          return const ScanSuccessScreen();
        },
      ),

      GoRoute(
        path: kProfileScreen,
        builder: (context, state) {
          return const ProfileScreen();
        },
      ),

      GoRoute(
        path: kChatBotScreen,
        builder: (context, state) {
          return const ChatBotScreen();
        },
      ),
      GoRoute(
        path: kEnrolledCoursesScreen,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => getIt<StudentCoursesCubit>(),
            child: const EnrolledCoursesScreen(),
          );
        },
      ),
      GoRoute(
        path: '$kCourseDetailsScreenWithParam/:courseId',
        builder: (context, state) {
          final courseId = state.pathParameters['courseId']!;
          final courseItem = state.extra as StudentCourseItem?;
          return BlocProvider(
            create: (context) =>
                getIt<CourseDetailsCubit>()..fetchCourseDetails(courseId),
            child: EnrolledCourseDetailsScreen(courseItem: courseItem),
          );
        },
      ),
      GoRoute(
        path: kSettingScreen,
        builder: (context, state) {
          return const SettingScreen();
        },
      ),
      GoRoute(
        path: kFaqScreen,
        builder: (context, state) {
          return const FAQScreen();
        },
      ),
      GoRoute(
        path: kSupportContactScreen,
        builder: (context, state) {
          return const SupportContactScreen();
        },
      ),
      GoRoute(
        path: kFeedbackScreen,
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<GetReportsCubit>()),
              BlocProvider(create: (context) => getIt<CreateReportCubit>()),
              BlocProvider(create: (context) => getIt<UpdateReportCubit>()),
            ],
            child: const FeedbackScreen(),
          );
        },
      ),
      GoRoute(
        path: kChangePasswordScreen,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => getIt<UpdatePassCubit>(),
            child: const ChangePasswordScreen(),
          );
        },
      ),
      GoRoute(
        path: kNotificationsScreen,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => getIt<GetAllNotificationsCubit>(),
            child: const NotificationsScreen(),
          );
        },
      ),
    ],
  );
}
