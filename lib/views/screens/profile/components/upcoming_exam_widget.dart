import 'package:get/get.dart';
import 'package:target_medical/controllers/get_controllers.dart';
import 'package:target_medical/controllers/profile_screen_controller.dart';
import 'package:target_medical/target_medical.dart';
import 'package:target_medical/views/widgets/exam_item_widget.dart';

class UpComingExamWidget extends StatelessWidget {
    UpComingExamWidget({
    Key? key,
  }) : super(key: key);

  final ProfileScreenController controller =
      GetControllers.instance.getProfileScreenController();

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'আসন্ন পরীক্ষা',
            style: AppTextStyles.semiBold16,
          ),
          SizedBox(height: 10.h),
         for(int i=0;i<controller.liveExams.length;i++)
           ExamItemWidget(
             color: AppColors.custom('#BB86FD'),
             borderColor: AppColors.gray,
             padding: EdgeInsets.zero,
             exam: controller.liveExams[i],
             onPressed: () {
               controller.onPressedLiveExam(
                   controller.examController.liveExams[i]);
             },
           )
         /* Obx(() {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: controller.liveExams.length,
                itemBuilder: (context, index) {
                  return ExamItemWidget(
                    color: AppColors.custom('#BB86FD'),
                    borderColor: AppColors.gray,
                    padding: EdgeInsets.zero,
                    exam: controller.liveExams[index],
                    onPressed: () {
                      controller.onPressedLiveExam(
                          controller.examController.liveExams[index]);
                    },
                  );
                });
          })*/
        ],
      ),
    );
  }
}
