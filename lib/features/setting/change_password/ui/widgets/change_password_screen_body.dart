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
import '../../logic/update_pass_cubit.dart';
import '../../logic/update_pass_state.dart';

class ChangePasswordScreenBody extends StatefulWidget {
  const ChangePasswordScreenBody({super.key});

  @override
  State<ChangePasswordScreenBody> createState() =>
      _ChangePasswordScreenBodyState();
}

class _ChangePasswordScreenBodyState extends State<ChangePasswordScreenBody> {
  bool isOldPassObscure = true;
  bool isNewPassObscure = true;
  bool isConfirmPassObscure = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdatePassCubit, UpdatePassState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (response) {
            customSnackBar(context, response.message, ColorsManager.success);
          },
          error: (error) {
            customSnackBar(context, error, ColorsManager.error);
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        final cubit = context.read<UpdatePassCubit>();

        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Form(
                key: cubit.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Change Password',
                      style: TextStyles.font24BlackBold.copyWith(
                        fontSize: 40.sp,
                      ),
                    ),
                    SizedBox(height: 32.h),

                    /// OLD PASSWORD
                    Text(
                      "Current Password",
                      style: TextStyles.font14BlackRegular,
                    ),
                    SizedBox(height: 8.h),
                    AppTextFormField(
                      controller: cubit.oldPassController,
                      hintText: "Enter your current password",
                      obscureText: isOldPassObscure,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your current password";
                        }
                        return null;
                      },
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isOldPassObscure = !isOldPassObscure;
                          });
                        },
                        child: Icon(
                          isOldPassObscure
                              ? Icons.visibility_off
                              : Icons.visibility,
                          size: 20.w,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),

                    /// NEW PASSWORD
                    Text("New Password", style: TextStyles.font14BlackRegular),
                    SizedBox(height: 8.h),
                    AppTextFormField(
                      controller: cubit.newPassController,
                      hintText: "Enter your new password",
                      obscureText: isNewPassObscure,
                      validator: (value) => AppRegex.validatePassword(value),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isNewPassObscure = !isNewPassObscure;
                          });
                        },
                        child: Icon(
                          isNewPassObscure
                              ? Icons.visibility_off
                              : Icons.visibility,
                          size: 20.w,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),

                    /// CONFIRM PASSWORD
                    Text(
                      "Confirm Password",
                      style: TextStyles.font14BlackRegular,
                    ),
                    SizedBox(height: 8.h),
                    AppTextFormField(
                      controller: cubit.confirmPassController,
                      hintText: "Confirm your new password",
                      obscureText: isConfirmPassObscure,
                      validator: (value) => AppRegex.validateConfirmPassword(
                        value,
                        cubit.newPassController.text,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isConfirmPassObscure = !isConfirmPassObscure;
                          });
                        },
                        child: Icon(
                          isConfirmPassObscure
                              ? Icons.visibility_off
                              : Icons.visibility,
                          size: 20.w,
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),
                    SizedBox(
                      width: double.infinity,
                      child: AppTextButton(
                        buttonText: "Change Password",
                        onPressed: () {
                          if (cubit.formKey.currentState!.validate()) {
                            cubit.emitUpdatePassStates();
                          }
                        },
                        isLoading: isLoading,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Forgot Password? ',
                          style: TextStyles.font14BlackRegular.copyWith(
                            color: ColorsManager.grey,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            GoRouter.of(
                              context,
                            ).push(AppRouter.kForgetPassScreen);
                          },
                          child: Text(
                            'Reset Password',
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
