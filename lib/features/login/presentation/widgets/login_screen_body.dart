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
import 'package:universe/features/login/logic/login_cubit.dart';
import 'package:universe/features/login/logic/login_state.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (_) {
            context.go(AppRouter.kHomeScreen);
          },
          error: (error) {
                        customSnackBar(context, error, ColorsManager.error);

          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        final cubit = context.read<LoginCubit>();
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Hey,\nWelcome Back',
                      style: TextStyles.font24PrimaryBold.copyWith(
                        fontSize: 40.sp,
                      ),
                    ),
                    SizedBox(height: 32.h),
                    Text('Email Address', style: TextStyles.font14BlackRegular),
                    SizedBox(height: 8.h),
                    AppTextFormField(
                      controller: cubit.emailController,
                      hintText: 'Enter your email',
                      keyboardType: TextInputType.emailAddress,
                      validator: AppRegex.validateEmail,
                    ),
                    SizedBox(height: 16.h),
                    Text('Password', style: TextStyles.font14BlackRegular),
                    SizedBox(height: 8.h),
                    _PasswordField(cubit: cubit),
                    SizedBox(height: 12.h),
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          GoRouter.of(context)
                              .push(AppRouter.kForgetPassScreen);
                        },
                        child: Text(
                          'Forgot password?',
                          style: TextStyles.font12PrimaryBold.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: ColorsManager.primary,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),
                    AppTextButton(
                      buttonText: 'Login',
                      isLoading: isLoading,
                      onPressed: () {
                        if (cubit.formKey.currentState!.validate()) {
                          cubit.emitLoginStates();
                          
                        }
                      },
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

class _PasswordField extends StatefulWidget {
  final LoginCubit cubit;

  const _PasswordField({required this.cubit});

  @override
  State<_PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<_PasswordField> {
  bool isPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: widget.cubit.passwordController,
      hintText: 'Enter your password',
      obscureText: isPasswordObscured,
      validator: AppRegex.validatePassword,
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            isPasswordObscured = !isPasswordObscured;
          });
        },
        child: Icon(
          isPasswordObscured ? Icons.visibility_off : Icons.visibility,
          size: 20.w,
        ),
      ),
    );
  }
}
