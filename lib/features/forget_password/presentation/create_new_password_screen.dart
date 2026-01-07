import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universe/core/di/service_locator.dart';
import 'package:universe/features/forget_password/logic/create_new_password_cubit/create_new_password_cubit.dart';
import 'package:universe/features/forget_password/presentation/widgets/create_new_password_screen_body.dart';


class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CreateNewPasswordCubit>(),
      child: const CreateNewPasswordScreenBody(),
    );
  }
}
