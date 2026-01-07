import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universe/features/fcm/data/models/get_all_notifications/get_all_notifications_response.dart';
import 'package:universe/features/fcm/logic/get_all_notifications_cubit/get_all_notifications_cubit.dart';
import 'package:universe/features/fcm/logic/get_all_notifications_cubit/get_all_notifications_state.dart';
import 'package:universe/features/fcm/ui/widgets/notifications_list_view.dart';
import 'package:universe/features/fcm/ui/widgets/notifications_list_view_skeletonizer.dart';

class NotificationBlocBuilder extends StatelessWidget {
  const NotificationBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllNotificationsCubit, GetAllNotificationsState>(
      buildWhen:
          (previous, current) =>
              current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return setupLoading();
          },
          success: (notificationsData) {
            var notificationsList = notificationsData;
            return setupSuccess(notificationsList ?? []);
          },
          error: (error) {
            return setupError();
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget setupLoading() {
    return const NotificationsListViewSkeletonizer();
  }

  Widget setupSuccess(List<NotificationData> notificationsList) {
    return NotificationsListView(notificationsList: notificationsList);
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
