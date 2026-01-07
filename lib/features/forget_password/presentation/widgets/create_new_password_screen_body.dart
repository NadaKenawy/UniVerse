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
import 'package:universe/features/forget_password/logic/create_new_password_cubit/create_new_password_cubit.dart';
import 'package:universe/features/forget_password/logic/create_new_password_cubit/create_new_password_state.dart';

class CreateNewPasswordScreenBody extends StatefulWidget {
  const CreateNewPasswordScreenBody({super.key});

  @override
  State<CreateNewPasswordScreenBody> createState() =>
      _CreateNewPasswordScreenBodyState();
}

class _CreateNewPasswordScreenBodyState
    extends State<CreateNewPasswordScreenBody> {
  bool isPasswordObscureText = true;
  bool isConfirmPasswordObscureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateNewPasswordCubit, CreatePasswordState>(
      listener: (context, state) {
        state.maybeWhen(
          createNewPasswordsuccess: (message) {
            customSnackBar(context, message, ColorsManager.success);
            context.go(AppRouter.kLoginScreen);
          },
          createNewPassworderrorerror: (error) {
            customSnackBar(context, error, ColorsManager.error);
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        final cubit = context.read<CreateNewPasswordCubit>();
        final isLoading = state.maybeWhen(
          createNewPasswordloading: () => true,
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
                      'Create New Password',
                      style: TextStyles.font24PrimaryBold.copyWith(
                        fontSize: 40.sp,
                      ),
                    ),
                    SizedBox(height: 32.h),
                    Text('New Password', style: TextStyles.font14BlackRegular),
                    SizedBox(height: 8.h),
                    AppTextFormField(
                      controller: cubit.newPasswordController,
                      hintText: 'Enter your password',
                      obscureText: isPasswordObscureText,
                      validator: (value) => AppRegex.validatePassword(value),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isPasswordObscureText = !isPasswordObscureText;
                          });
                        },
                        child: Icon(
                          size: 20.w,
                          isPasswordObscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Confirm New Password',
                      style: TextStyles.font14BlackRegular,
                    ),
                    SizedBox(height: 8.h),
                    AppTextFormField(
                      controller: cubit.passwordConfirmController,
                      hintText: 'Enter your password again',
                      obscureText: isConfirmPasswordObscureText,
                      validator:
                          (value) => AppRegex.validateConfirmPassword(
                            value,
                            cubit.newPasswordController.text,
                          ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isConfirmPasswordObscureText =
                                !isConfirmPasswordObscureText;
                          });
                        },
                        child: Icon(
                          size: 20.w,
                          isConfirmPasswordObscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),
                    AppTextButton(
                      buttonText: 'Confirm',
                      onPressed: () {
                        if (cubit.formKey.currentState!.validate()) {
                          cubit.emitCreateNewPasswordStates();
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
