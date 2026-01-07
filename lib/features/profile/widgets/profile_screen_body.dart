import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universe/core/constants/user_cubit.dart';
import 'package:universe/features/profile/widgets/profile_data_fields.dart';
import 'package:universe/features/profile/widgets/profile_name_and_bio.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserCubit>().state.user;
    if (user == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfileNameAndBio(user: user),
            SizedBox(height: 20.h),
            ProfileDataFields(user: user),
          ],
        ),
      ),
    );
  }
}
