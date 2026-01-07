import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universe/core/theme/text_styles.dart';
import 'package:universe/core/widgets/custom_button.dart';
import 'package:universe/core/widgets/custom_text_form_field.dart';
import 'package:universe/features/setting/add_complaint/logic/complaint_cubit.dart';
import 'package:universe/features/setting/add_complaint/logic/complaint_state.dart';

class WriteComplaintDialog extends StatefulWidget {
  const WriteComplaintDialog({super.key});

  @override
  State<WriteComplaintDialog> createState() => _WriteComplaintDialogState();
}

class _WriteComplaintDialogState extends State<WriteComplaintDialog> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ComplaintCubit>();

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Close button
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  iconSize: 24.sp,
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),

              /// Title
              Center(
                child: Text(
                  'Write Your Complaint',
                  style: TextStyles.font16BlackBold,
                ),
              ),

              SizedBox(height: 16.h),

              Form(
                key: cubit.formKey,
                child: AppTextFormField(
                  controller: cubit.subjectController,
                  maxLines: 5,
                  hintText: 'Describe your issue here',
                  hintStyle: TextStyles.font16BlackBold.copyWith(
                    fontSize: 14,
                    color: Colors.grey[500],
                  ),
                  contentPadding: const EdgeInsets.all(12),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Complaint can’t be empty';
                    }
                    return null;
                  },
                ),
              ),

              SizedBox(height: 16.h),
              BlocConsumer<ComplaintCubit, ComplaintState>(
                listener: (context, state) {
                  state.whenOrNull(
                    success: (_) {
                      cubit.clearController();
                      Navigator.of(context).pop(true);
                    },
                  );
                },
                builder: (context, state) {
                  return SizedBox(
                    width: double.infinity,
                    child: AppTextButton(
                      buttonText: 'Submit',
                      isLoading: state is Loading,
                      onPressed: () {
                        if (cubit.formKey.currentState!.validate()) {
                          cubit.emitAddComplaintStates();
                        }
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
