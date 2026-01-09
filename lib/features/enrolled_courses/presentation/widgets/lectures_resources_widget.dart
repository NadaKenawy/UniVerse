import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universe/core/theme/colors_manager.dart';
import 'package:universe/core/theme/text_styles.dart';
import 'package:universe/core/utils/snackbar.dart';
import 'package:universe/features/enrolled_courses/data/models/course_details/course_details_response.dart';
import 'package:url_launcher/url_launcher.dart';

class LecturesResourcesWidget extends StatefulWidget {
  final String title;
  final List<Lecture> lectures;
  final List<String>? materialLinks;
  final List<String>? quizLinks;

  const LecturesResourcesWidget({
    super.key,
    required this.title,
    required this.lectures,
    this.materialLinks,
    this.quizLinks,
  });

  @override
  State<LecturesResourcesWidget> createState() =>
      _LecturesResourcesWidgetState();
}

class _LecturesResourcesWidgetState extends State<LecturesResourcesWidget> {
  int selectedLectureIndex = 0;

  Future<void> _openLink(String link) async {
    final fixedLink = link.startsWith('http') ? link : 'https://$link';
    final uri = Uri.parse(fixedLink);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.lectures.isEmpty) {
      return Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyles.font16BlackBold.copyWith(fontSize: 20.sp),
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: ColorsManager.primary,
                  size: 20.sp,
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    'Materials will be available soon',
                    style: TextStyles.font14BlackMedium,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyles.font16BlackBold.copyWith(fontSize: 20.sp),
          ),
          SizedBox(height: 12.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                widget.lectures.length,
                (index) => Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12.r),
                    onTap: () {
                      setState(() {
                        selectedLectureIndex = index;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 10.h,
                      ),
                      decoration: BoxDecoration(
                        color: selectedLectureIndex == index
                            ? ColorsManager.primary
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: ColorsManager.primary),
                      ),
                      child: Text(
                        widget.lectures[index].name ?? 'Unknown Lecture',
                        style: selectedLectureIndex == index
                            ? TextStyles.font14WhiteSemiBold
                            : TextStyles.font14PrimarySemiBold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          if ((widget.lectures[selectedLectureIndex].links?.isNotEmpty ??
              false)) ...[
            Text('Links', style: TextStyles.font14BlackBold),
            SizedBox(height: 8.h),
            ...(widget.lectures[selectedLectureIndex].links!.map(
              (link) => _LinkItem(link: link, onTap: () => _openLink(link)),
            )),
          ] else ...[
            Text(
              'No links available for this lecture',
              style: TextStyles.font14BlackMedium,
            ),
          ],
          SizedBox(height: 16.h),
          if ((widget.materialLinks?.isNotEmpty ?? false)) ...[
            Text('Material Links', style: TextStyles.font14BlackBold),
            SizedBox(height: 8.h),
            ...(widget.materialLinks!.map(
              (link) => _LinkItem(link: link, onTap: () => _openLink(link)),
            )),
          ],
          SizedBox(height: 16.h),
          if ((widget.quizLinks?.isNotEmpty ?? false)) ...[
            Text('Quiz Links', style: TextStyles.font14BlackBold),
            SizedBox(height: 8.h),
            ...(widget.quizLinks!.map(
              (link) => _LinkItem(link: link, onTap: () => _openLink(link)),
            )),
          ],
        ],
      ),
    );
  }
}

class _LinkItem extends StatelessWidget {
  final String link;
  final VoidCallback onTap;

  const _LinkItem({required this.link, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: InkWell(
        onTap: onTap,
        onLongPress: () {
          Clipboard.setData(ClipboardData(text: link));
          customSnackBar(context, 'Link Copied', ColorsManager.success);
        },
        borderRadius: BorderRadius.circular(6.r),
        child: Row(
          children: [
            Icon(Icons.link, size: 18.sp, color: ColorsManager.primary),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                link,
                style: TextStyles.font14PrimaryMedium.copyWith(
                  color: ColorsManager.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: ColorsManager.primary,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
