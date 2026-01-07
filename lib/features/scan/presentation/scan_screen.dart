import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universe/core/di/service_locator.dart';
import 'package:universe/features/scan/logic/scan_cubit.dart';
import 'package:universe/features/scan/presentation/widgets/scan_screen_body.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ScanCubit>(),
      child: const ScanScreenBody(),
    );
  }
}
