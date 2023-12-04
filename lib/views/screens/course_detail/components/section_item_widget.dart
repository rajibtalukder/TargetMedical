import 'package:get/get.dart';
import 'package:target_medical/target_medical.dart';
import 'package:target_medical/models/course_section_model.dart';
import 'package:target_medical/views/screens/pdf_view/pdf_view_screen.dart';
import 'package:target_medical/views/screens/video_view/video_view_screen.dart';
import 'package:target_medical/views/widgets/expand_widget.dart';

class SectionItemWidget extends StatelessWidget {
  final CourseSectionModel section;
  final bool showAll;

  SectionItemWidget({Key? key, required this.section, this.showAll = false})
      : super(key: key);

  final ValueNotifier<bool> expand = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: expand,
        builder: (context, value, child) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 4.h),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    expand.value = !value;
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 16.w,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.pink2,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            section.sectionTitle,
                            style: AppTextStyles.semiBold14,
                          ),
                        ),
                        arrowIcon(value),
                      ],
                    ),
                  ),
                ),
                ExpandWidget(
                  expand: value,
                  child: Container(
                    padding: EdgeInsets.only(top: 8.h),
                    decoration: BoxDecoration(
                      color: AppColors.pink3.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: section.lectures.length,
                        itemBuilder: (context, index) {
                          return itemWidget(section.lectures[index]);
                        }),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget arrowIcon(value) {
    return AnimatedRotation(
      duration: const Duration(milliseconds: 700),
      curve: Curves.fastOutSlowIn,
      turns: value ? -0.25 : 0.25,
      child: SvgPicture.asset(
        AppIcons.forwardArrow,
        color: AppColors.black,
        width: 24.h,
        height: 24.h,
      ),
    );
  }

  Widget itemWidget(Lecture lecture) {
    return InkWell(
      onTap: () {
        if (showAll) {
          if (lecture.isVideo) {
            Get.to(
              () => VideoViewScreen(
                name: lecture.name,
                url: lecture.data,
              ),
            );
          } else {
            Get.to(
              () => PdfViewScreen(
                name: lecture.name,
                url: lecture.data,
              ),
            );
          }
        } else {
          if (!lecture.isPublic) return;
          if (lecture.isVideo) {
            Get.to(
              () => VideoViewScreen(
                name: lecture.name,
                url: lecture.data,
              ),
            );
          } else {
            Get.to(
              () => PdfViewScreen(
                name: lecture.name,
                url: lecture.data,
              ),
            );
          }
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        child: Column(
          children: [
            SizedBox(height: 8.h),
            Row(
              children: [
                SvgPicture.asset(
                  lecture.isVideo ? AppIcons.videoPink : AppIcons.filePink,
                  height: 20.h,
                  width: 20.h,
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    lecture.name,
                    style: AppTextStyles.semiBold14,
                  ),
                ),
                Visibility(
                  visible: showAll == true ? false : !lecture.isPublic,
                  child: Icon(
                    Icons.lock_rounded,
                    size: 14.h,
                    color: AppColors.pink,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}
