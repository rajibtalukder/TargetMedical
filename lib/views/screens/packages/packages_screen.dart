import 'package:target_medical/target_medical.dart';
import 'package:target_medical/controllers/packages_screen_controller.dart';
import 'package:target_medical/controllers/get_controllers.dart';
import 'package:get/get.dart';
import 'package:target_medical/views/screens/buy_package/buy_package_screen.dart';
import 'package:target_medical/views/screens/packages/components/packages_widget.dart';

class PackagesScreen extends StatelessWidget {
  PackagesScreen({Key? key}) : super(key: key);

  final PackagesScreenController controller =
      GetControllers.instance.getPackagesScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppAppBarStyles.white,
     // backgroundColor: AppColors.white,
      body: BuyPackageScreen()
      /*body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
          ),
          child: Column(
            children: [
              SizedBox(height: 24.h),
              titleBarWidget(),
              SizedBox(height: 18.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      richTextWidget(),
                      SizedBox(height: 24.h),
                      ourPackagesWidget(),
                      SizedBox(height: 16.h),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return const PackagesWidget();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),*/
    );
  }

  Widget titleBarWidget() {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Get.back();
          },
          child: SvgPicture.asset(
            AppIcons.backArrow,
            color: AppColors.black,
            height: 24.h,
            width: 24.h,
          ),
        ),
        SizedBox(width: 18.w),
        Text(
          'প্যাকেজসমূহ',
          style: AppTextStyles.semiBold18.copyWith(color: AppColors.black),
        ),
      ],
    );
  }

  Widget richTextWidget() {
    return Column(
      children: [
        Text(
          'আপনি বর্তমানে  Free Trial প্যাকেজটি ব্যবহার করছেন',
          style: AppTextStyles.regular14,
        ),
        SizedBox(height:8.h),
        Text(
          'সময়সীমাঃ ১ঘণ্টা',
          style: AppTextStyles.regular14.copyWith(color: AppColors.red),
        ),

      ],
    );
  }

  Widget ourPackagesWidget() {
    return Column(
      children: [
        Text(
          'আমাদের প্যাকেজসমূহ',
          style: AppTextStyles.semiBold16,
        ),
        SizedBox(height: 8.h),
        Container(
          height: 1.h,
          width: 272.w,
          color: AppColors.black,
        ),
        SizedBox(height: 18.h),
        Row(
          children: [
            Text(
              'Medical Admission',
              style: AppTextStyles.regular13.copyWith(color: AppColors.gray),
            ),
            SizedBox(width: 16.w),
            Text(
              'Pre-medical Preparation',
              style: AppTextStyles.semiBold18.copyWith(color: AppColors.black),
            ),
          ],
        ),
      ],
    );
  }
}
