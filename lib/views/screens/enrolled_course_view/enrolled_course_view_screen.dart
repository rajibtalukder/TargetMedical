import 'package:flutter/cupertino.dart';
import 'package:target_medical/target_medical.dart';
import 'package:target_medical/controllers/enrolled_course_view_screen_controller.dart';
import 'package:target_medical/controllers/get_controllers.dart';
import 'package:get/get.dart';
import 'package:target_medical/views/screens/course_detail/components/section_item_widget.dart';

class EnrolledCourseViewScreen extends StatelessWidget {
  EnrolledCourseViewScreen({Key? key}) : super(key: key);

  final EnrolledCourseViewScreenController controller =
      GetControllers.instance.getEnrolledCourseViewScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarStyles.black,
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Obx(() {
          if (controller.loading.isTrue) {
            return Center(
              child: CupertinoActivityIndicator(
                color: AppColors.black,
              ),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headerWidget(),
              SizedBox(height: 12.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  'অধ্যায় সমূহ',
                  style: AppTextStyles.semiBold16,
                ),
              ),
              SizedBox(height: 8.h),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  shrinkWrap: true,
                  itemCount: controller.sections.length,
                  itemBuilder: (context, index) {
                    return SectionItemWidget(
                      showAll: true,
                      section: controller.sections[index],

                    );
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget headerWidget() {
    return Obx(() {
      return Container(
        color: AppColors.black,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: SvgPicture.asset(
                AppIcons.backArrow,
                color: AppColors.white,
                width: 24.h,
                height: 24.h,
              ),
            ),
            SizedBox(width: 24.w),
            Expanded(
              child: Text(
                controller.title.value,
                style: AppTextStyles.semiBold20.copyWith(
                  fontSize: 18.sp,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
