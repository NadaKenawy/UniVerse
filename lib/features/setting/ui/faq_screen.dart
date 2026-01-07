import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universe/core/theme/colors_manager.dart';
import 'package:universe/core/theme/text_styles.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  final List<Map<String, String>> faqData = const [
    {
      'question': '1. What is the purpose of the application?',
      'answer':
          'The application helps students manage their courses, track attendance, view lectures, and access all academic services in one place.',
    },
    {
      'question': '2. How can I register my courses?',
      'answer':
          'You can register your courses directly from the courses section by selecting your subjects and confirming your registration.',
    },
    {
      'question': '3. How does attendance tracking work?',
      'answer':
          'Attendance is recorded by scanning a QR code during lectures, and your attendance percentage is updated automatically.',
    },
    {
      'question': '4. Can I view my absence percentage?',
      'answer':
          'Yes, the application allows you to view your attendance and absence percentage for each registered course.',
    },
    {
      'question': '5. Where can I find my lecture schedule?',
      'answer':
          'Your lecture schedule is available in the timetable section, showing all lectures organized by day and time.',
    },
    {
      'question': '6. Can I access my lectures through the app?',
      'answer':
          'Yes, you can view lecture details and available materials directly from the lectures section.',
    },
    {
      'question': '7. How can I contact student affairs?',
      'answer':
          'You can send your issues or inquiries to student affairs through the in-app support section.',
    },
    {
      'question': '8. What is the chatbot used for?',
      'answer':
          'The chatbot helps answer common questions and guides you through using different features of the application.',
    },
    {
      'question': '9. Can I update my personal information?',
      'answer':
          'Yes, you can edit your personal information such as name, email, and phone number from your profile page.',
    },
    {
      'question': '10. What should I do if I face a technical problem?',
      'answer':
          'If you face any issues, you can contact support through the app or use the chatbot for quick assistance.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64.h,
        title: Text(
          'FAQs',
          style: TextStyles.font24WhiteBold.copyWith(fontSize: 20.sp),
        ),
        backgroundColor: ColorsManager.primary,
        iconTheme: IconThemeData(color: Colors.white, size: 24.sp),
      ),
      body: Column(
        children: [
          SizedBox(height: 16.h),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: faqData.length,
              itemBuilder: (context, index) {
                final item = faqData[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Theme(
                      data: Theme.of(
                        context,
                      ).copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        tilePadding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ),
                        iconColor: Colors.black,
                        collapsedIconColor: Colors.black,
                        title: Text(
                          item['question']!,
                          style: TextStyles.font14BlackBold,
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 12.0,
                              bottom: 12,
                            ),
                            child: Text(
                              item['answer']!,
                              style: TextStyles.font14BlackBold.copyWith(
                                color: Colors.grey[600],
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      height: 1,
                      color: Colors.grey.shade200,
                    ),
                    const SizedBox(height: 4),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
