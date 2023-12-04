import 'package:get/get.dart';
import 'package:target_medical/controllers/get_controllers.dart';
import 'package:target_medical/controllers/home_screen_controller.dart';
import 'package:target_medical/target_medical.dart';
import 'package:target_medical/views/screens/result/exam_result_screen.dart';
import 'package:target_medical/views/widgets/exam_item_widget.dart';

class LiveMCQExamWidget extends StatelessWidget {
  LiveMCQExamWidget({
    Key? key,
  }) : super(key: key);

  final HomeScreenController controller =
      GetControllers.instance.getHomeScreenController();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.examController.liveExams.isEmpty) {
          return Container();
        }
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 8.h,
                    width: 8.w,
                    decoration: BoxDecoration(
                      color: AppColors.red,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Live',
                            style: AppTextStyles.semiBold16.copyWith(
                              color: AppColors.red,
                            ),
                          ),
                          TextSpan(
                            text: ' MCQ পরীক্ষা',
                            style: AppTextStyles.semiBold16.copyWith(
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.to(const ExamResultScreen());
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 5.h,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(color: AppColors.green2)),
                      child: Text(
                        'Check Result',
                        style:
                            AppTextStyles.semiBold14.copyWith(color: AppColors.green2),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
             /* Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(

                        vertical: 6.h,
                      ),
                      color: AppColors.black,
                      child: Text(
                        'Medical Admission',
                        style: AppTextStyles.semiBold14.copyWith(color: AppColors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                     alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(

                        vertical: 6.h,
                      ),
                      color: AppColors.white,
                      child: Text(
                        'Pre-medical Preparation',
                        style: AppTextStyles.semiBold14.copyWith(color: AppColors.gray),
                      ),
                    ),
                  )
                ],
              ),*/
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.examController.liveExams.length,
                itemBuilder: (context, index) {
                  return ExamItemWidget(
                    padding: EdgeInsets.zero,
                    exam: controller.examController.liveExams[index],
                    onPressed: () {
                      controller.onPressedLiveExam(
                          controller.examController.liveExams[index]);
                    },
                  );
                },
              ),

            ],
          ),
        );
      },
    );
  }
}
