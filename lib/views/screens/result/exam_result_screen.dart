import 'package:get/get.dart';
import 'package:target_medical/views/screens/result/result_screen.dart';

import '../../../controllers/check_result_screen_controller.dart';
import '../../../controllers/get_controllers.dart';
import '../../../controllers/home_screen_controller.dart';
import '../../../target_medical.dart';

class ExamResultScreen extends StatelessWidget {
  const ExamResultScreen({super.key});

  static final HomeScreenController controller =
      GetControllers.instance.getHomeScreenController();
  static final CheckResultScreenController checkResultController =
      GetControllers.instance.getCheckResultController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarStyles.white,
      backgroundColor: AppColors.white,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 40.h),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.examController.liveExams.length,
            itemBuilder: (context, index) {
              return checkResultItemWidget(index);
            }),
      )),
    );
  }

  Widget checkResultItemWidget(int i) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h),
      child: InkWell(
        onTap: () async {
          await checkResultController.getFavQuestions(controller.examController.liveExams[i].examId!.toInt());
        // await checkResultController.getFavQuestions(4);
          //controller.onPressedChapter(chapter);
          Get.to(const ResultScreen());
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: AppColors.white2,
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  controller.examController.liveExams[i].examName.toString(),
                  style:
                      AppTextStyles.semiBold14.copyWith(color: AppColors.black),
                ),
              ),
              //const Spacer(),
              SvgPicture.asset(
                AppIcons.forwardArrow,
                color: AppColors.black,
                width: 24.h,
                height: 24.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
