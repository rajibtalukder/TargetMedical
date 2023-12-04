import 'package:target_medical/target_medical.dart';
import 'package:target_medical/controllers/terms_and_condition_screen_controller.dart';
import 'package:target_medical/controllers/get_controllers.dart';
import 'package:get/get.dart';

class TermsAndConditionScreen extends StatelessWidget {
  TermsAndConditionScreen({Key? key}) : super(key: key);

  final TermsAndConditionScreenController controller =
      GetControllers.instance.getTermsAndConditionScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarStyles.white,
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Obx(()=> Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: controller.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      SizedBox(height: 24.h),
                      titleBarWidget(),
                      SizedBox(height: 32.h),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                               Text(
                                  controller.aboutUs[0].description,
                                  style: AppTextStyles.regular14,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
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
        Obx(
          () => Text(
            controller.aboutUs[0].title,
            style: AppTextStyles.semiBold18.copyWith(color: AppColors.black),
          ),
        ),
      ],
    );
  }
}
