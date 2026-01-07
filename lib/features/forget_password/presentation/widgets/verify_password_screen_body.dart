import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:universe/app/router.dart';
import 'package:universe/core/theme/colors_manager.dart';
import 'package:universe/core/theme/text_styles.dart';
import 'package:universe/core/utils/snackbar.dart';
import 'package:universe/core/widgets/custom_button.dart';
import 'package:universe/features/forget_password/logic/forget_password_cubit/forget_password_cubit.dart';
import 'package:universe/features/forget_password/logic/verify_password_cubit/verify_password_cubit.dart';
import 'package:universe/features/forget_password/logic/verify_password_cubit/verify_password_state.dart';

class VerifyPasswordScreenBody extends StatelessWidget {
  const VerifyPasswordScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyPasswordCubit, VerifyPasswordState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (data) {
            context.push(AppRouter.kCreateNewPasswordScreen);
          },
          error: (error) {
            customSnackBar(context, error, ColorsManager.error);
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        final cubit = context.read<VerifyPasswordCubit>();
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        final defaultPinTheme = PinTheme(
          width: 55.w,
          height: 55.h,
          textStyle: TextStyles.font16BlackRegular,
          decoration: BoxDecoration(
            color: const Color(0xffe5e9ef),
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: const Color(0xffe5e9ef), width: 2),
          ),
        );

        final focusedPinTheme = defaultPinTheme.copyWith(
          decoration: BoxDecoration(
            color: const Color(0xffe5e9ef),
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: ColorsManager.primary, width: 2),
          ),
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
                      'Verification Code',
                      style: TextStyles.font24BlackBold.copyWith(
                        fontSize: 40.sp,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'success! A verification code has been sent to your email address. Please enter the code below to verify your account.',
                      style: TextStyles.font14BlackRegular,
                    ),
                    SizedBox(height: 32.h),
                    Pinput(
                      controller: cubit.otpField,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Code can\'t be empty';
                        }
                        if (value.length < 6) {
                          return 'Code must be 6 digits';
                        }
                        return null;
                      },
                      length: 6,
                      showCursor: true,
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                    ),
                    SizedBox(height: 32.h),
                    AppTextButton(
                      buttonText: 'Confirm',
                      onPressed: () {
                        if (cubit.formKey.currentState!.validate()) {
                          cubit.emitVerifyPasswordStates();
                        }
                      },
                      isLoading: isLoading,
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Didn\'t receive the code? ',
                          style: TextStyles.font14BlackRegular,
                        ),
                        InkWell(
                          onTap: () async {
                            await context
                                .read<ForgetPasswordCubit>()
                                .emitForgetPasswordStates();
                            if (context.mounted) {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.success,
                                animType: AnimType.bottomSlide,
                                title: 'Code Sent Successfully',
                                titleTextStyle: TextStyles.font16BlackBold
                                    .copyWith(fontSize: 20.sp),
                                desc:
                                    'success! The verification code has been resent to your email.',
                                descTextStyle: TextStyles.font14BlackRegular,
                                btnOkText: 'OK',
                                btnOkOnPress: () {},
                                btnOkColor: ColorsManager.primary,
                                dismissOnBackKeyPress: true,
                                dismissOnTouchOutside: true,
                                width: 400,
                                padding: EdgeInsets.all(20.w),
                                dialogBorderRadius: BorderRadius.circular(20.r),
                                showCloseIcon: false,
                                buttonsTextStyle: TextStyles.font14WhiteBold,
                                customHeader: const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 100,
                                ),
                              ).show();
                            }
                          },
                          child: Text(
                            'Resend Code',
                            style: TextStyles.font14PrimaryBold.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: ColorsManager.primary,
                            ),
                          ),
                        ),
                      ],
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
