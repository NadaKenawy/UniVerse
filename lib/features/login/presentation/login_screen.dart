import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universe/core/constants/user_cubit.dart';
import 'package:universe/core/di/service_locator.dart';
import 'package:universe/features/login/logic/login_cubit.dart';
import 'package:universe/features/login/presentation/widgets/login_screen_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<LoginCubit>()),
        BlocProvider(create: (context) => getIt<UserCubit>()),
      ],
      child: const LoginScreenBody(),
    );
  }
}
