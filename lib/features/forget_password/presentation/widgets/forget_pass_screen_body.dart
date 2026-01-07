import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:universe/app/router.dart';
import 'package:universe/core/constants/app_regex.dart';
import 'package:universe/core/theme/colors_manager.dart';
import 'package:universe/core/theme/text_styles.dart';
import 'package:universe/core/utils/snackbar.dart';
import 'package:universe/core/widgets/custom_button.dart';
import 'package:universe/core/widgets/custom_text_form_field.dart';
import 'package:universe/features/forget_password/logic/forget_password_cubit/forget_password_cubit.dart';
import 'package:universe/features/forget_password/logic/forget_password_cubit/forget_password_state.dart';

class ForgetPassScreenBody extends StatelessWidget {
  const ForgetPassScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (data) {
            context.push(AppRouter.kVerifyPasswordScreen);
          },
          error: (error) {
            customSnackBar(context, error, ColorsManager.error);
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        final cubit = context.read<ForgetPasswordCubit>();
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0.w),
              child: Form(
                key: cubit.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Forgot Your Password?',
                      style: TextStyles.font24PrimaryBold.copyWith(
                        fontSize: 40.sp,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Don’t worry! Just enter your email address associated with your account and we’ll send you instructions to reset your password.',
                      style: TextStyles.font14BlackRegular,
                    ),
                    SizedBox(height: 32.h),
                    Text('Email Address', style: TextStyles.font14BlackRegular),
                    SizedBox(height: 8.h),
                    AppTextFormField(
                      controller: cubit.emailController,
                      hintText: 'Enter your email address',
                      validator: (value) => AppRegex.validateEmail(value),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 32.h),
                    AppTextButton(
                      buttonText: 'Confirm',
                      onPressed: () {
                        if (cubit.formKey.currentState!.validate()) {
                          cubit.emitForgetPasswordStates();
                        }
                      },
                      isLoading: isLoading,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
