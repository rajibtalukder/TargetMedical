import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:target_medical/controllers/home_screen_controller.dart';
import 'package:target_medical/target_medical.dart';
import 'package:target_medical/controllers/courses_screen_controller.dart';
import 'package:target_medical/controllers/get_controllers.dart';
import 'package:get/get.dart';
import 'package:target_medical/models/courses_model.dart';

class CoursesScreen extends StatelessWidget {
  CoursesScreen({Key? key}) : super(key: key);

  final CoursesScreenController controller =
      GetControllers.instance.getCoursesScreenController();
  final HomeScreenController homeController =
      GetControllers.instance.getHomeScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarStyles.white,
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: AppColors.white,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset(
                      AppIcons.backArrow,
                      color: AppColors.black,
                      width: 24.h,
                      height: 24.h,
                    ),
                  ),
                  SizedBox(width: 24.w),
                  Text(
                    'কোর্স সমূহ',
                    style: AppTextStyles.semiBold20.copyWith(
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(width: 24.w),
                  Opacity(
                    opacity: 0.0,
                    child: SvgPicture.asset(
                      AppIcons.backArrow,
                      color: AppColors.black,
                      width: 24.h,
                      height: 24.h,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                ),
                decoration: BoxDecoration(
                    color: AppColors.white2,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(4.r))),
                child: AlignedGridView.count(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.h,
                  crossAxisSpacing: 16.w,
                  itemCount: homeController.courses.length,
                  itemBuilder: (context, index) {
                    return itemWidget(homeController.courses[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemWidget(Course course) {
    return InkWell(
      onTap: () {
        homeController.gotoCourseDetail(course);
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(8.r)),
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
                    imageUrl: course.courseBanner!,
                    placeholder: (context, url) {
                      return Container(
                        width: 200.w,
                        height: 90.h,
                        color: AppColors.lightGray,
                      );
                    },
                    errorWidget: (context, url, error) {
                      return Container(
                        width: 200.w,
                        height: 90.h,
                        color: AppColors.lightGray,
                      );
                    },
                    width: 200.w,
                    height: 90.h,
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
                        style: AppTextStyles.semiBold14,
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'মূল্য - ${course.coursePrice.toString().enNumToBeNum}',
                        style: AppTextStyles.regular12
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
