import 'package:get/get.dart';
import 'package:target_medical/controllers/get_controllers.dart';
import 'package:target_medical/controllers/profile_screen_controller.dart';
import 'package:target_medical/target_medical.dart';

class ScoreboardWidget extends StatelessWidget {
  ScoreboardWidget({Key? key}) : super(key: key);

  final ProfileScreenController controller =
      GetControllers.instance.getProfileScreenController();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Card(
        elevation: 4,
        shadowColor: AppColors.black.withOpacity(0.25),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 16.h,
            horizontal: 16.w,
          ),
          child: Row(
            children: [
              itemWidget(
                name: 'মোট পরীক্ষা',
                value: controller.totalExamCount.value.enNumToBeNum,
              ),
              verticalWidget(),
              itemWidget(
                name: 'লাইভ পরীক্ষা',
                value: controller.liveExamCount.value.enNumToBeNum,
              ),
              verticalWidget(),
              itemWidget(
                name: 'অন্যান্য পরীক্ষা',
                value: controller.othersExamCount.value.enNumToBeNum,
              ),
              verticalWidget(),
              itemWidget(
                name: 'কোর্স',
                value: controller.totalCourseCount.value.enNumToBeNum,
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget itemWidget({required String name, required String value}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: AppTextStyles.regular16,
          ),
          SizedBox(height: 4.h),
          Text(
            name,
            style: AppTextStyles.regular12,
          ),
        ],
      ),
    );
  }

  Widget verticalWidget() {
    return Container(
      height: 35.h,
      width: 1.5.w,
      color: AppColors.lightBlueAccent,
    );
  }
}
