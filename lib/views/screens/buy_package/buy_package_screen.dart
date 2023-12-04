import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../controllers/buy_package_screen_controller.dart';
import '../../../controllers/get_controllers.dart';
import '../../../models/package_model.dart';
import '../../../models/payment_method_model.dart';
import '../../../target_medical.dart';
import '../free _trial/free_trial_screen.dart';

class BuyPackageScreen extends StatelessWidget {
  BuyPackageScreen({Key? key}) : super(key: key);

  final BuyPackageScreenController controller =
      GetControllers.instance.getBuyPackageScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarStyles.blue,
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              headerWidget(),
              SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(() => FreeTrialScreen());
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 16.h,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.blue,
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
                          'ফ্রি ট্রায়াল ',
                          style: AppTextStyles.title.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    packageDataWidget(),
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
                          color: AppColors.blue,
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
                          style: AppTextStyles.title.copyWith(
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
      color: AppColors.blue,
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
              'প্যাকেজ কিনুন',
              style: AppTextStyles.screenTitle.copyWith(
                fontSize: 18.sp,
                color: AppColors.white,
              ),
            ),
          ),
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
            style: AppTextStyles.widgetTitle,
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
              style: AppTextStyles.body,
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
                style: AppTextStyles.widgetTitle,
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
                  hint: 'ট্রান্‌জ্যাক‌শন আইডি', controller: controller.trxId),
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
          color: AppColors.lightBlueAccent,
          borderRadius: BorderRadius.circular(8.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 18.h,
            height: 18.h,
          ),
          Text('${data.method}    ${data.number.toString().enNumToBeNum}',
              style: AppTextStyles.title),
          InkWell(
            onTap: () async {
              await Clipboard.setData(
                  ClipboardData(text: data.number.toString()));
              ScaffoldMessenger.of(Get.context!).showSnackBar(
                SnackBar(
                  content: Center(
                    child: Text('নম্বরটা কপি করা হয়েছে!',
                        style: AppTextStyles.title),
                  ),
                  duration: const Duration(milliseconds: 700),
                  backgroundColor: AppColors.lightBlueAccent,
                  behavior: SnackBarBehavior.floating,
                  margin:
                      EdgeInsets.symmetric(horizontal: 50.w, vertical: 24.h),
                ),
              );
            },
            child: Icon(Icons.content_copy_rounded,
                size: 18.h, color: AppColors.blue),
          ),
        ],
      ),
    );
  }

  Widget packageDataWidget() {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(8.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'প্যাকেজ অপশন',
            textAlign: TextAlign.center,
            style: AppTextStyles.widgetTitle,
          ),
          SizedBox(height: 12.h),
          Obx(() {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: controller.package.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        controller.packageMethodIndex.value = index;
                        controller.packageAmount.value = controller
                            .package[controller.packageMethodIndex.value]
                            .amount!;
                        print(controller.packageMethodIndex);
                        print(controller.packageAmount.value);
                      },
                      child:
                          packageItemWidget(controller.package[index], index));
                });
          }),
        ],
      ),
    );
  }

  Widget packageItemWidget(Package data, int index) {
    return Obx(
      () => Container(
        margin: EdgeInsets.only(bottom: 8.h),
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        decoration: BoxDecoration(
            color: controller.packageMethodIndex.value == index
                ? AppColors.blueAccent
                : AppColors.lightBlueAccent,
            borderRadius: BorderRadius.circular(20.r)),
        child: Column(
          children: [
            Text(
              data.packageName.toString(),
              textAlign: TextAlign.center,
              style: AppTextStyles.widgetTitle,
            ),
            Text(
              data.amount.toString(),
              textAlign: TextAlign.center,
              style: AppTextStyles.screenTitle,
            ),
            Text(
              data.time.toString(),
              textAlign: TextAlign.center,
              style: AppTextStyles.widgetTitle,
            ),
            // Text(
            //   data.packageDetail.toString(),
            //   textAlign: TextAlign.center,
            //   style: AppTextStyles.widgetTitle,
            // ),
          ],
        ),
      ),
    );
  }
}
