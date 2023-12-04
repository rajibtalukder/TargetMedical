import 'package:flutter/cupertino.dart';
import 'package:target_medical/target_medical.dart';
import 'package:target_medical/controllers/buy_course_screen_controller.dart';
import 'package:target_medical/controllers/get_controllers.dart';
import 'package:get/get.dart';
import 'package:target_medical/models/payment_method_model.dart';
import 'package:target_medical/views/widgets/custom_images.dart';
import 'package:target_medical/views/widgets/widget_loading.dart';

class BuyCourseScreen extends StatelessWidget {
  BuyCourseScreen({Key? key}) : super(key: key);

  final BuyCourseScreenController controller =
      GetControllers.instance.getBuyCourseScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarStyles.black,
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: WidgetLoading(
          loading: controller.loading,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headerWidget(),
              SizedBox(height: 12.h),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  children: [
                    courseDataWidget(),
                    SizedBox(height: 24.h),
                    paymentWidget(),
                    SizedBox(height: 24.h),
                    textFieldWidget(),
                    SizedBox(height: 24.h),
                    InkWell(
                      onTap: () {
                        controller.submit();
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
                          'সাবমিট ',
                          style: AppTextStyles.semiBold14.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget headerWidget() {
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
              'কোর্স কিনুন',
              style: AppTextStyles.semiBold20.copyWith(
                fontSize: 18.sp,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget courseDataWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
                color: AppColors.lightBlue.withOpacity(0.12), blurRadius: 16)
          ]),
      child: Row(
        children: [
          CustomImages.normal(
            source: controller.courseData.courseBanner!,
            width: 100.w,
            height: 90.h,
          ),
          SizedBox(width: 8.w),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.courseData.courseName!,
                style: AppTextStyles.semiBold14,
              ),
              SizedBox(height: 6.h),
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
                            color: AppColors.black,
                            fontSize: 14.sp,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  '${controller.course.value.discountPrice.toString().enNumToBeNum}  ',
                              style: AppTextStyles.semiBold11.copyWith(
                                color: AppColors.black,
                                fontSize: 16.sp,
                              ),
                            ),
                            TextSpan(
                              text:
                                  '${controller.course.value.coursePrice.toString().enNumToBeNum}  ',
                              style: AppTextStyles.semiBold11.copyWith(
                                color: AppColors.black,
                                fontSize: 12.sp,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: AppColors.black,
                                decorationThickness: 2.5.h,
                              ),
                            ),
                          ]),
                    ),
            ],
          )),
        ],
      ),
    );
  }

  Widget paymentWidget() {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(8.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'পেমেন্ট অপশন',
            textAlign: TextAlign.center,
            style: AppTextStyles.semiBold16,
          ),
          SizedBox(height: 12.h),
          Obx(() {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: controller.paymentMethods.length,
                itemBuilder: (context, index) {
                  return paymentItemWidget(controller.paymentMethods[index]);
                });
          }),
          SizedBox(height: 8.h),
          Center(
            child: Text(
              'উক্ত নাম্বারে কোর্স ফি ক্যাশ আউট করে নিচের তথ্য গুলো দিয়ে\nসাবমিট বাটনে ক্লিক করুন।',
              textAlign: TextAlign.center,
              style:AppTextStyles.semiBold11.copyWith(color: AppColors.gray),
            ),
          ),
        ],
      ),
    );
  }

  Widget textFieldWidget() {
    return Obx(() {
      return Container(
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(8.r)),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'পেমেন্ট তথ্য',
                textAlign: TextAlign.center,
                style: AppTextStyles.semiBold16,
              ),
              AppTextFieldStyles.selectable(
                  hint: 'পেমেন্ট অপশন',
                  enable: false,
                  option: controller.paymentMethods
                      .map((element) => element.method.toString())
                      .toList(),
                  onTap: (index) {
                    controller.paymentMethodIndex = index;
                  }),
              SizedBox(height: 8.h),
              AppTextFieldStyles.text(
                  hint: 'ট্রানসাকশান আইডি', controller: controller.trxId),
              SizedBox(height: 8.h),
              AppTextFieldStyles.number(
                  hint: 'প্রেরকের নম্বর', controller: controller.senderNumber),
            ],
          ),
        ),
      );
    });
  }

  Widget paymentItemWidget(PaymentMethod data) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      decoration: BoxDecoration(
          color: AppColors.black.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 18.h,
            height: 18.h,
          ),
          Text('${data.method}    ${data.number.toString().enNumToBeNum}',
              style: AppTextStyles.semiBold14),
          InkWell(
            onTap: () async {
              await Clipboard.setData(
                  ClipboardData(text: data.number.toString()));
              ScaffoldMessenger.of(Get.context!).showSnackBar(
                SnackBar(
                  content: Center(
                    child: Text('নম্বরটা কপি করা হয়েছে!',
                        style: AppTextStyles.semiBold14),
                  ),
                  duration: const Duration(milliseconds: 700),
                  backgroundColor: AppColors.pink2,
                  behavior: SnackBarBehavior.floating,
                  margin:
                      EdgeInsets.symmetric(horizontal: 50.w, vertical: 24.h),
                ),
              );
            },
            child: Icon(Icons.content_copy_rounded,
                size: 18.h, color: AppColors.black),
          ),
        ],
      ),
    );
  }
}
