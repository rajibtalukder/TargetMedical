import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:target_medical/controllers/get_controllers.dart';
import 'package:target_medical/controllers/home_screen_controller.dart';
import 'package:target_medical/models/courses_model.dart';
import 'package:target_medical/views/screens/books/books_screen.dart';
import 'package:target_medical/target_medical.dart';

import '../../courses/courses_screen.dart';

class CoursesWidget extends StatelessWidget {
  CoursesWidget({
    Key? key,
  }) : super(key: key);

  final HomeScreenController controller =
      GetControllers.instance.getHomeScreenController();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.courses.isEmpty) {
        return Container();
      }
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 14.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'কোর্স সমূহ',
                  style: AppTextStyles.semiBold16,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => CoursesScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'আরো দেখুন',
                        style: AppTextStyles.semiBold11.copyWith(color: AppColors.blue2),
                      ),
                      SvgPicture.asset(
                        AppIcons.forwardArrow,
                        width: 12.h,
                        height: 12.h,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            height: 180.h,
            child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: controller.courses.length,
                itemBuilder: (context, index) {
                  return itemWidget(controller.courses[index]);
                }),
          )
        ],
      );
    });
  }

  Widget itemWidget(Course course) {
    return InkWell(
      onTap: () {
        controller.gotoCourseDetail(course);
      },
      child: Container(
        margin: EdgeInsets.only(right: 16.w),
        width: 200.w,
        height: 180.h,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8.r),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: course.courseBanner??'',
                    placeholder: (context, url) {
                      return Container(
                        width: 200.w,
                        height: 110.h,
                        color: AppColors.lightGray,
                      );
                    },
                    errorWidget: (context, url, error) {
                      return Container(
                        width: 200.w,
                        height: 110.h,
                        color: AppColors.lightGray,
                      );
                    },
                    width: 200.w,
                    height: 110.h,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course.courseName!,
                        textAlign: TextAlign.start,
                        style: AppTextStyles.regular13,
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'মূল্য - ${course.coursePrice.toString().enNumToBeNum}',
                        style: AppTextStyles.regular10
                            .copyWith(color: AppColors.gray),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Visibility(
              visible: course.discount! == 0 ? false : true,
              child: Positioned(
                top: 8.h,
                right: 6.w,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 6.w),
                  decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(16.r)),
                  child: Text(
                    '${course.discount!.toString().enNumToBeNum}% ছাড়',
                    textAlign: TextAlign.start,
                    style: AppTextStyles.semiBold14.copyWith(
                      color: AppColors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
