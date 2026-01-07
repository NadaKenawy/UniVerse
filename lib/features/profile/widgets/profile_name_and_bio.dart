import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universe/core/constants/user_model.dart';
import 'package:universe/core/theme/text_styles.dart';

class ProfileNameAndBio extends StatelessWidget {
  const ProfileNameAndBio({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    ImageProvider provider;
    if (user.profileImage != null && user.profileImage!.isNotEmpty) {
      provider = NetworkImage(user.profileImage!);
    } else {
      provider = const AssetImage(
        'assets/images/download.png',
      ); // Replace with actual asset
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 60.h),
        Container(
          width: 160.w,
          height: 160.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[300],
            border: Border.all(color: Colors.white, width: 4),
            image: DecorationImage(image: provider, fit: BoxFit.cover),
          ),
        ),
        Text(
          '${user.name[0]}${user.name.substring(1)}',
          style: TextStyles.font24BlackSemiBold,
        ),
        Text(
          'For data changes, visit Student Affairs. ❤️',
          style: TextStyles.font16BlackRegular,
        ),
      ],
    );
  }
}
