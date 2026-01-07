import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universe/core/theme/colors_manager.dart';
import 'package:universe/core/widgets/custom_text_form_field.dart';

class MessageInputField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onSend;

  const MessageInputField({
    super.key,
    required this.controller,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 40.h),
      child: Row(
        children: [
          Expanded(
            child: AppTextFormField(
              controller: controller,
              hintText: 'Type your question...',
            ),
          ),

          SizedBox(width: 8.w),

          /// Send Button
          Container(
            decoration: const BoxDecoration(
              color: ColorsManager.primary,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white),
              onPressed: () {
                final text = controller.text.trim();
                if (text.isNotEmpty) {
                  onSend(text);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
