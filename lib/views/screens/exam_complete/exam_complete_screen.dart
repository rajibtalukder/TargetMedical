import 'package:intl/intl.dart';
import 'package:target_medical/target_medical.dart';
import 'package:target_medical/controllers/exam_complete_screen_controller.dart';
import 'package:target_medical/controllers/get_controllers.dart';
import 'package:get/get.dart';
import 'package:target_medical/views/screens/main/main_screen.dart';
import 'package:target_medical/views/widgets/widget_loading.dart';

class ExamCompleteScreen extends StatelessWidget {
  ExamCompleteScreen({Key? key}) : super(key: key);

  final ExamCompleteScreenController controller =
      GetControllers.instance.getExamCompleteScreenController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.onTapGoToHome();
        return false;
      },
      child: Scaffold(
        appBar: AppAppBarStyles.white,
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: WidgetLoading(
            loading: controller.loading,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 16.h),
                    Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {
                          controller.onTapGoToHome();
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
                      DateFormat('dd MMMM, yyyy').format(DateTime.now()),
                      style:   AppTextStyles.regular13.copyWith(color: AppColors.gray),
                    ),
                    SizedBox(height: 36.h),
                    Text(
                      'আপনার পরীক্ষা টি সম্পন্ন হয়েছে!',
                      style: AppTextStyles.semiBold20,
                    ),
                    SizedBox(height: 36.h),
                    SvgPicture.asset(
                      AppIcons.checkIcon,
                      width: 53.h,
                      height: 53.h,
                    ),
                    SizedBox(height: 36.h),
                    Text(
                      controller.examName.value,
                      style: AppTextStyles.semiBold16,
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      'প্রশ্ন - ${controller.questionCount.toString().enNumToBeNum} টি',
                      style: AppTextStyles.regular12,
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'সময় - ${controller.time.toString().enNumToBeNum} মিনিট',
                      style: AppTextStyles.regular12,
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        controller.onTapReview();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 18.h, horizontal: 33.w),
                        decoration: BoxDecoration(
                          color: AppColors.black,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Text(
                          'রিভিউ করুন',
                          style: AppTextStyles.regular16.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.onTapGoToHome();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 18.h, horizontal: 33.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Text(
                          'হোমে যান',
                          style: AppTextStyles.regular16.copyWith(
                            color: AppColors.gray,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 56.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
