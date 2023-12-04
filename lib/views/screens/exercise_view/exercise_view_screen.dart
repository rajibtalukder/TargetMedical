import 'package:target_medical/target_medical.dart';
import 'package:target_medical/controllers/exercise_view_screen_controller.dart';
import 'package:target_medical/controllers/get_controllers.dart';
import 'package:get/get.dart';
import 'package:target_medical/views/widgets/widget_loading.dart';

import '../exam_review/components/question_item_widget.dart';

class ExerciseViewScreen extends StatelessWidget {
  ExerciseViewScreen({Key? key}) : super(key: key);

  final ExerciseViewScreenController controller =
      GetControllers.instance.getExerciseViewScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarStyles.white,
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: WidgetLoading(
          loading: controller.loading,
          child: Column(
            children: [
              headerWidget(context),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(4.r))),
                  child: Obx(() {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.questions.length,
                        itemBuilder: (context, index) {
                          return QuestionItemWidget(
                            index: index,
                            question: controller.questions[index],
                            onlyQuestion: true,
                          );
                        });
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget headerWidget(context) {
    return Obx(() => Container(
          color: AppColors.white,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Row(
            children: [
              InkWell(
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
              SizedBox(width: 24.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.name.value,
                      style: AppTextStyles.semiBold20.copyWith(
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'প্রশ্ন - ${controller.questions.length.toString().enNumToBeNum} টি',
                          style: AppTextStyles.semiBold11.copyWith(color: AppColors.black),
                        ),
                        Text(
                          'বিষয় - ${controller.subject.value}',
                          style: AppTextStyles.semiBold11.copyWith(color: AppColors.gray, fontSize: 12.sp),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
            ],
          ),
        ));
  }
}
