import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universe/core/di/service_locator.dart';
import 'package:universe/features/forget_password/logic/forget_password_cubit/forget_password_cubit.dart';
import 'package:universe/features/forget_password/presentation/widgets/forget_pass_screen_body.dart';

class ForgetPassScreen extends StatelessWidget {
  const ForgetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ForgetPasswordCubit>()..loadSavedEmail(),
      child: const ForgetPassScreenBody(),
    );
  }
}
