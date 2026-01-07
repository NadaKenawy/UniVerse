import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universe/core/constants/user_model.dart';
import 'package:universe/core/theme/text_styles.dart';

import '../../../../core/widgets/custom_text_form_field.dart';

class ProfileDataFields extends StatelessWidget {
  const ProfileDataFields({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Full Name', style: TextStyles.font14BlackRegular),
          SizedBox(height: 8.h),
          AppTextFormField(hintText: user.name, readOnly: true, enabled: false),
          SizedBox(height: 16.h),
          Text('Email Address', style: TextStyles.font14BlackRegular),
          SizedBox(height: 8.h),
          AppTextFormField(
            hintText: user.email,
            readOnly: true,
            enabled: false,
          ),
          SizedBox(height: 16.h),
          Text('Phone Number', style: TextStyles.font14BlackRegular),
          SizedBox(height: 8.h),
          AppTextFormField(
            hintText: user.phoneNumber ?? '',
            readOnly: true,
            enabled: false,
          ),
          SizedBox(height: 16.h),

          Text('Date of Birth', style: TextStyles.font14BlackRegular),
          SizedBox(height: 8.h),
          AppTextFormField(
            hintText: user.dateOfBirth != null
                ? user.dateOfBirth!.toLocal().toString().split(' ')[0]
                : '',
            readOnly: true,
            enabled: false,
          ),
          SizedBox(height: 16.h),

          Text('Department', style: TextStyles.font14BlackRegular),
          SizedBox(height: 8.h),
          AppTextFormField(
            hintText: user.department ?? '',
            readOnly: true,
            enabled: false,
          ),
          SizedBox(height: 16.h),

          Text('Level', style: TextStyles.font14BlackRegular),
          SizedBox(height: 8.h),
          AppTextFormField(
            hintText: user.level ?? '',
            readOnly: true,
            enabled: false,
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
