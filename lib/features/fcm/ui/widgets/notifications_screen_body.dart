import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universe/core/di/service_locator.dart';
import 'package:universe/core/theme/colors_manager.dart';
import 'package:universe/core/theme/text_styles.dart';
import 'package:universe/features/fcm/logic/get_all_notifications_cubit/get_all_notifications_cubit.dart';
import 'package:universe/features/fcm/ui/widgets/notification_bloc_builder.dart';

class NotificationsScreenBody extends StatelessWidget {
  const NotificationsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = getIt<GetAllNotificationsCubit>();
        cubit.fetchNotifications();
        return cubit;
      },
      child: Scaffold(
        appBar: AppBar(
        toolbarHeight: 64.h,
        title: Text(
          'Notifications',
          style: TextStyles.font24WhiteBold.copyWith(fontSize: 20.sp),
        ),
        backgroundColor: ColorsManager.primary,
        iconTheme: IconThemeData(color: Colors.white, size: 24.sp),
      ),
        body: const NotificationBlocBuilder(),
      ),
    );
  }
}
