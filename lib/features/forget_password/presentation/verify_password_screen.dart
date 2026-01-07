import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universe/core/di/service_locator.dart';
import 'package:universe/features/forget_password/logic/forget_password_cubit/forget_password_cubit.dart';
import 'package:universe/features/forget_password/logic/verify_password_cubit/verify_password_cubit.dart';
import 'package:universe/features/forget_password/presentation/widgets/verify_password_screen_body.dart';

class VerifyPasswordScreen extends StatelessWidget {
  const VerifyPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<VerifyPasswordCubit>()),
        BlocProvider(create: (context) => getIt<ForgetPasswordCubit>()),
      ],
      child: const VerifyPasswordScreenBody(),
    );
  }
}
