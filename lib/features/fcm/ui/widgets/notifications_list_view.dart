import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:universe/core/theme/colors_manager.dart';
import 'package:universe/core/theme/text_styles.dart';
import 'package:universe/features/fcm/data/models/get_all_notifications/get_all_notifications_response.dart';
import 'package:universe/features/fcm/ui/widgets/no_notifications_text.dart';

class NotificationsListView extends StatelessWidget {
  const NotificationsListView({super.key, required this.notificationsList});
  final List<NotificationData> notificationsList;

  @override
  Widget build(BuildContext context) {
    if (notificationsList.isEmpty) {
      return const NoNotificationsText();
    }
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      itemCount: notificationsList.length,
      itemBuilder: (BuildContext context, int index) {
        final notification = notificationsList[index];
        final createdAt = notification.createdAt;
        final formattedTime = DateFormat(
          'hh:mm a',
        ).format(createdAt.add(const Duration(hours: 2)));
        return NotificationItem(
          title: notification.title,
          message: notification.subject,
          time: formattedTime,
        );
      },
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String title;
  final String message;
  final String time;

  const NotificationItem({
    super.key,
    required this.title,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: ColorsManager.primary, width: 1.w),
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: ColorsManager.primary.withValues(alpha: 0.1),
              blurRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title and Time
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            shortenText(title, maxCharacters: 40),
                            style: TextStyles.font16BlackBold,
                          ),
                        ),
                        Text(
                          time,
                          style: TextStyles.font12BlackRegular.copyWith(
                            color: ColorsManager.darkGrey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      shortenText(message, maxCharacters: 80),
                      style: TextStyles.font12BlackRegular.copyWith(
                        color: ColorsManager.darkGrey,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String shortenText(String text, {int? maxCharacters, int? maxWords}) {
  if (maxCharacters != null && text.length > maxCharacters) {
    return '${text.substring(0, maxCharacters)}...';
  }

  if (maxWords != null && text.split(' ').length > maxWords) {
    return '${text.split(' ').take(maxWords).join(' ')}...';
  }

  return text;
}
