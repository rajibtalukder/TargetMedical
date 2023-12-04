import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:target_medical/target_medical.dart';
import 'package:target_medical/controllers/course_detail_screen_controller.dart';
import 'package:target_medical/controllers/get_controllers.dart';
import 'package:get/get.dart';
import 'package:target_medical/views/widgets/custom_images.dart';

import 'components/promo_view_widget.dart';
import 'components/section_item_widget.dart';

class CourseDetailScreen extends StatelessWidget {
  CourseDetailScreen({Key? key}) : super(key: key);

  final CourseDetailScreenController controller =
      GetControllers.instance.getCourseDetailScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarStyles.white,
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.white,
      body: Obx(() {
        if (controller.loading.isTrue) {
          return Center(
            child: CupertinoActivityIndicator(
              color: AppColors.black,
            ),
          );
        } else {
          return ListView(
            children: [
              Column(
                children: [
                  imagesWidget(),
                  titleWidget(),
                  bodyWidget(),
                ],
              ),
            ],
          );
        }
      }),
    );
  }

  Widget imagesWidget() {
    return Stack(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            height: 220.h,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            autoPlay: true,
            onPageChanged: (index, reason) {
              // currentIndex.value = index;
            },
          ),
          // carouselController: carouselController,
          itemCount: controller.courseDetail.courseBanner!.length,
          itemBuilder: (context, index, realIndex) {
            return CustomImages.normal(
              fit: BoxFit.fill,
              source:
                  controller.courseDetail.courseBanner![index].image.toString(),
            );
          },
        ),
        Positioned(
          top: 16.h,
          left: 16.w,
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: SvgPicture.asset(
                AppIcons.backArrow,
                color: AppColors.white,
                width: 24.h,
                height: 24.h,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget titleWidget() {
    return Container(
      color: AppColors.black,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            controller.course.value.courseName.toString(),
            style: AppTextStyles.semiBold18.copyWith(
              color: AppColors.white,
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              controller.course.value.discount! == 0
                  ? RichText(
                      text: TextSpan(
                          text: 'মূল্য : ',
                          style: AppTextStyles.semiBold11.copyWith(
                            color: AppColors.white,
                            fontSize: 14.sp,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  '${controller.course.value.coursePrice.toString().enNumToBeNum}  ',
                              style: AppTextStyles.semiBold11.copyWith(
                                color: AppColors.white,
                                fontSize: 16.sp,
                              ),
                            ),
                          ]),
                    )
                  : RichText(
                      text: TextSpan(
                          text: 'মূল্য : ',
                          style: AppTextStyles.semiBold11.copyWith(
                            color: AppColors.white,
                            fontSize: 14.sp,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  '${controller.course.value.discountPrice.toString().enNumToBeNum}  ',
                              style: AppTextStyles.semiBold11.copyWith(
                                color: AppColors.white,
                                fontSize: 16.sp,
                              ),
                            ),
                            TextSpan(
                              text:
                                  '${controller.course.value.coursePrice.toString().enNumToBeNum}  ',
                              style: AppTextStyles.semiBold11.copyWith(
                                color: AppColors.white,
                                fontSize: 12.sp,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: Colors.white,
                                decorationThickness: 2.5.h,
                              ),
                            ),
                          ]),
                    ),
              Visibility(
                visible: controller.course.value.discount! == 0 ? false : true,
                child: Text(
                  'ছাড় : ${controller.course.value.discount!.toString().enNumToBeNum}%',
                  textAlign: TextAlign.start,
                  style: AppTextStyles.semiBold14.copyWith(
                    color: AppColors.white,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              infoWidget(
                  icon: AppIcons.miniVideo,
                  data:
                      '${controller.courseDetail.videoLecture!.length.toString().enNumToBeNum} ক্লাস রেকর্ড'),
              infoWidget(
                  icon: AppIcons.miniFile,
                  data:
                      '${controller.courseDetail.fileLecture!.length.toString().enNumToBeNum} ক্লাস নোট'),
            ],
          ),
        ],
      ),
    );
  }

  Widget infoWidget(
      {required String icon, required String data, Color? color}) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              icon,
              color: color,
              width: 18.h,
              height: 18.h,
            ),
            SizedBox(width: 6.w),
            Text(
              data,
              style: AppTextStyles.semiBold11.copyWith(
                  color: AppColors.white, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }

  Widget bodyWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24.h),
          courseInformationWidget(),
          SizedBox(height: 24.h),
          const PromoViewWidget(),
          SizedBox(height: 24.h),
          teachersWidget(),
          SizedBox(height: 24.h),
          objectiveInformationWidget(),
          SizedBox(height: 24.h),
          sectionsWidget(),
          SizedBox(height: 24.h),
          controller.isAlreadyBuy.isTrue
              ? InkWell(
                  onTap: () {
                    controller.startCourse();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 16.h,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          spreadRadius: 0,
                          offset: Offset(0, 1.h),
                          color: AppColors.black.withOpacity(0.25),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Text(
                      'এনরোল  (৫৭৭ টাকা)',
                      style: AppTextStyles.semiBold14.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                )
              : InkWell(
                  onTap: () {
                    controller.buyCourse();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 16.h,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          spreadRadius: 0,
                          offset: Offset(0, 1.h),
                          color: AppColors.black.withOpacity(0.25),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: RichText(
                      text: TextSpan(
                        text: 'এনরোল  ',
                        style: AppTextStyles.semiBold14.copyWith(
                          color: AppColors.white,
                        ),
                        children: [
                          TextSpan(
                            style: AppTextStyles.semiBold11.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.w300,
                            ),
                            text: controller.course.value.discount! == 0
                                ? '(${controller.course.value.coursePrice.toString().enNumToBeNum} টাকা)'
                                : '(${controller.course.value.discountPrice.toString().enNumToBeNum} টাকা)',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }

  Widget courseInformationWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'কোর্স সম্পর্কিত তথ্য',
          style: AppTextStyles.semiBold16,
        ),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 8.h,
            horizontal: 12.w,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Text(
            controller.course.value.desApi!.replaceAll('\\n', '\n'),
            style: AppTextStyles.regular12,
          ),
        ),
      ],
    );
  }

  Widget objectiveInformationWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'কোর্সটি করার উদ্দেশ্যে',
          style: AppTextStyles.semiBold16,
        ),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 8.h,
            horizontal: 12.w,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Text(
            controller.course.value.objectiveApi!.replaceAll('\\n', '\n'),
            style: AppTextStyles.regular12,
          ),
        ),
      ],
    );
  }

  Widget teachersWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'কোর্স টিচার্স',
          style: AppTextStyles.semiBold16,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
          child: Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: controller.courseDetail.courseTeacher!.map((teacher) {
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomImages.normal(
                      radius: 100,
                      width: 36.h,
                      height: 36.h,
                      source: teacher.teacherImg.toString(),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      teacher.teacherName.toString(),
                      style: AppTextStyles.semiBold16,
                    ),
                    SizedBox(width: 12.w),
                  ],
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }

  Widget sectionsWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'অধ্যায় সমূহ',
          style: AppTextStyles.semiBold16,
        ),
        SizedBox(height: 8.h),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.sections.length,
            itemBuilder: (context, index) {
              return SectionItemWidget(
                section: controller.sections[index],
              );

              // return ClassRecordItemWidget(index: index,);
            })
      ],
    );
  }
}
