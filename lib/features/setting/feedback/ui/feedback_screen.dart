import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universe/core/di/service_locator.dart';
import 'package:universe/core/theme/colors_manager.dart';
import 'package:universe/core/theme/text_styles.dart';
import 'package:universe/features/setting/feedback/logic/create_report_cubit/create_report_cubit.dart';
import 'package:universe/features/setting/feedback/logic/get_reports_cubit/get_reports_cubit.dart';
import 'package:universe/features/setting/feedback/logic/update_report_cubit/update_report_cubit.dart';
import 'widgets/get_feedbacks_bloc_builder.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GetReportsCubit>(),
        ),
        BlocProvider(create: (context) => getIt<CreateReportCubit>()),
        BlocProvider(create: (context) => getIt<UpdateReportCubit>()),
      ],
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 64.h,
          title: Text(
            'Feedbacks',
            style: TextStyles.font24WhiteBold.copyWith(fontSize: 20.sp),
          ),
          backgroundColor: ColorsManager.primary,
          iconTheme: IconThemeData(color: Colors.white, size: 24.sp),
        ),
        body: const GetFeedbacksBlocBuilder(),
      ),
    );
  }
}
