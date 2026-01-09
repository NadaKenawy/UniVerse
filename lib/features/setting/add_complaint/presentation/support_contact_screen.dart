import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universe/core/di/service_locator.dart';
import 'package:universe/core/theme/colors_manager.dart';
import 'package:universe/core/theme/text_styles.dart';
import 'package:universe/core/widgets/custom_button.dart';
import 'package:universe/features/setting/add_complaint/logic/complaint_cubit.dart';
import 'package:universe/features/setting/add_complaint/presentation/widgets/write_complaint_dialog.dart';

class SupportContactScreen extends StatelessWidget {
  const SupportContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64.h,
        title: Text(
          'Support Contact',
          style: TextStyles.font24WhiteBold.copyWith(fontSize: 20.sp),
        ),
        backgroundColor: ColorsManager.primary,
        iconTheme: IconThemeData(color: Colors.white, size: 24.sp),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'If you need any help or have any questions, feel free to contact our support team.',
                      style: TextStyles.font16PrimaryBold,
                    ),
                    const SizedBox(height: 24),
                    buildSupportCard(),
                    const SizedBox(height: 24),
                    buildSocialMediaCard(context),
                    SizedBox(height: 28.h),
                    BlocProvider(
                      create: (_) => getIt<ComplaintCubit>(),
                      child: Builder(
                        builder: (context) {
                          return AppTextButton(
                            buttonText: 'Contact us',
                            onPressed: () async {
                              final success = await showDialog<bool>(
                                context: context,
                                builder: (_) => BlocProvider.value(
                                  value: context.read<ComplaintCubit>(),
                                  child: const WriteComplaintDialog(),
                                ),
                              );

                              if (success == true && context.mounted) {
                                showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    title: Text(
                                      'Thank you',
                                      style: TextStyles.font24PrimaryBold,
                                    ),
                                    content: Text(
                                      'Your complaint has been sent successfully',
                                      style: TextStyles.font16BlackBold,
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text('Close'),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSupportCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: .1),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Customer Support', style: TextStyles.font16BlackBold),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.phone, color: ColorsManager.primary),
              const SizedBox(width: 8),
              Text(
                'Contact Number',
                style: TextStyles.font16BlackBold.copyWith(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(width: 8),
              Text('+20-123-456-7890', style: TextStyles.font14BlackBold),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.email_outlined, color: ColorsManager.primary),
              const SizedBox(width: 8),
              Text(
                'Email Address',
                style: TextStyles.font16BlackBold.copyWith(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  'support@universe.com',
                  style: TextStyles.font14BlackBold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSocialMediaCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: .1),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Social Media', style: TextStyles.font16BlackBold),
          const SizedBox(height: 12),
          buildSocialRow(
            FontAwesomeIcons.twitter,
            'Twitter',
            'twitter@universe.com',
            ColorsManager.primary.withValues(alpha: .6),
          ),
          const SizedBox(height: 8),
          buildSocialRow(
            Icons.facebook,
            'Facebook',
            'facebook@universe.com',
            ColorsManager.primary,
          ),
          const SizedBox(height: 8),
          buildSocialRow(
            FontAwesomeIcons.instagram,
            'Instagram',
            'instagram@universe.com',
            Colors.pinkAccent,
          ),
        ],
      ),
    );
  }

  Widget buildSocialRow(
    IconData icon,
    String platform,
    String handle,
    Color color,
  ) {
    return Row(
      children: [
        Icon(icon, color: color),
        const SizedBox(width: 8),
        Text(
          platform,
          style: TextStyles.font14BlackBold.copyWith(color: Colors.grey[600]),
        ),
        const SizedBox(width: 8),
        Text(handle, style: TextStyles.font14BlackBold),
      ],
    );
  }
}
