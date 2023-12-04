import 'package:intl/intl.dart';
import 'package:target_medical/target_medical.dart';
import 'package:target_medical/controllers/filter_screen_controller.dart';
import 'package:target_medical/controllers/get_controllers.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class FilterScreen extends StatelessWidget {
  FilterScreen({Key? key}) : super(key: key);

  final FilterScreenController controller =
      GetControllers.instance.getFilterScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarStyles.white,
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16.h),
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
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
              ),
              SizedBox(height: 56.h),
              Text(
                DateFormat('dd MMMM, yyyy').format(controller.date),
                style: AppTextStyles.regular13.copyWith(color: AppColors.gray),
              ),
              SizedBox(height: 36.h),
              Text(
                controller.examName.value,
                style: AppTextStyles.semiBold20,
              ),
              const Spacer(),
              Obx(() {
                return Opacity(
                  opacity: controller.isSubjective.isTrue ? 1.0 : 0.0,
                  child: IgnorePointer(
                    ignoring: !controller.isSubjective.value,
                    child: Column(
                      children: [
                        //questionsSliderWidget(),
                        SizedBox(height: 44.h),
                        //timeSliderWidget(),
                      ],
                    ),
                  ),
                );
              }),
              const Spacer(),
              InkWell(
                onTap: () {
                  controller.goToExamScreen();
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 18.h, horizontal: 33.w),
                  decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Text(
                    'এগিয়ে যান',
                    style: AppTextStyles.regular16.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 18.h, horizontal: 33.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Text(
                    'বাতিল করুন',
                    style:
                        AppTextStyles.regular16.copyWith(color: AppColors.gray),
                  ),
                ),
              ),
              SizedBox(height: 56.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget questionsSliderWidget() {
    return Obx(
      () {
        return Column(
          children: [
            Text(
              'প্রশ্ন - ${controller.questionCount.value.toInt()} টি',
              style: AppTextStyles.semiBold14.copyWith(color: AppColors.black),
            ),
            SfSliderTheme(
              data: SfSliderThemeData(
                activeDividerRadius: 6.h,
                inactiveDividerRadius: 6.h,
                inactiveDividerColor: AppColors.black,
                activeDividerColor: AppColors.black,
                activeTrackColor: AppColors.black,
                thumbColor: AppColors.white,
                thumbStrokeColor: AppColors.black,
                thumbStrokeWidth: 1.5.h,
                inactiveTrackColor: AppColors.black,
                activeTrackHeight: 1.5.h,
                inactiveTrackHeight: 1.5.h,
                overlayColor: AppColors.black.withOpacity(0.12),
                thumbRadius: 12.5.h,
                activeLabelStyle: AppTextStyles.regular11,
                inactiveLabelStyle: AppTextStyles.regular11,
              ),
              child: SfSlider(
                min: 10,
                max: 30,
                interval: 5,
                showDividers: true,
                stepSize: 5,
                value: controller.questionCount.value,
                labelFormatterCallback: (actualValue, formattedText) {
                  if (actualValue == 10.0) {
                    return '10';
                  }
                  if (actualValue == 20.0) {
                    return '20';
                  }
                  if (actualValue == 30.0) {
                    return '30';
                  }
                  return '';
                },
                showLabels: true,
                onChanged: (value) {
                  controller.questionCount.value = value;
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget timeSliderWidget() {
    return Obx(
      () {
        return Column(
          children: [
            Text(
              'সময় - ${controller.time.value.toInt()} মিনিট',
              style: AppTextStyles.semiBold14.copyWith(color: AppColors.black),
            ),
            SfSliderTheme(
              data: SfSliderThemeData(
                thumbColor: AppColors.white,
                thumbStrokeColor: AppColors.black,
                thumbStrokeWidth: 1.5.h,
                activeTrackColor: AppColors.black,
                inactiveTrackColor: AppColors.black,
                activeTrackHeight: 1.5.h,
                inactiveTrackHeight: 1.5.h,
                overlayColor: AppColors.black.withOpacity(0.12),
                thumbRadius: 12.5.h,
                activeLabelStyle: AppTextStyles.regular11,
                inactiveLabelStyle: AppTextStyles.regular11,
              ),
              child: SfSlider(
                min: 2,
                max: 20,
                showDividers: true,
                value: controller.time.value,
                labelFormatterCallback: (actualValue, formattedText) {
                  if (actualValue == 2.0) {
                    return '2';
                  }
                  if (actualValue == 20.0) {
                    return '20';
                  }

                  return '';
                },
                showLabels: true,
                onChanged: (value) {
                  controller.time.value = value;
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
