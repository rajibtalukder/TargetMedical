import 'package:target_medical/target_medical.dart';
import 'package:target_medical/controllers/exam_review_screen_controller.dart';
import 'package:target_medical/controllers/get_controllers.dart';
import 'package:get/get.dart';
import 'package:target_medical/views/screens/exam_review/components/question_item_widget.dart';
import 'package:target_medical/target_medical.dart';
import 'package:target_medical/views/widgets/widget_loading.dart';

class ExamReviewScreen extends StatelessWidget {
  ExamReviewScreen({Key? key}) : super(key: key);

  final ExamReviewScreenController controller =
      GetControllers.instance.getExamReviewScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarStyles.black,
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: WidgetLoading(
          loading: controller.loading,
          child: Column(
            children: [
              headerWidget(context),
              Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.only(
                      left: 26.w,
                      right: 26.w,
                      bottom: 24.h
                    ),
                    shrinkWrap: true,
                    itemCount: controller.questions.length,
                    itemBuilder: (context, index) {
                      return QuestionItemWidget(
                        index: index,
                        question: controller.questions[index],
                        onlyQuestion: false,
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget headerWidget(context) {
    return Container(
      color: AppColors.black,
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
      ),
      child: Column(
        children: [
          SizedBox(height: 16.h),
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.examName.value,
                      style: AppTextStyles.semiBold20.copyWith(
                        fontSize: 18.sp,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'প্রশ্ন - ${controller.questions.length.toString().enNumToBeNum} টি',
                      style:
                          AppTextStyles.semiBold11.copyWith(color: AppColors.white),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'সঠিক - ${controller.correctAns.toString().enNumToBeNum} টি',
                    style: AppTextStyles.regular12
                        .copyWith(color: AppColors.green),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    'ভুল- ${controller.wrongAns.toString().enNumToBeNum} টি',
                    style: AppTextStyles.regular12
                        .copyWith(color: AppColors.yellow),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    'অনুত্তরিত - ${controller.skipAns.toString().enNumToBeNum} টি',
                    style: AppTextStyles.regular12
                        .copyWith(color: AppColors.white),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: RichText(
              text: TextSpan(
                  text: controller.ansWithNegative.toString().enNumToBeNum,
                  style: AppTextStyles.regular16.copyWith(
                    fontSize: 24.sp,
                    color: AppColors.green,
                  ),
                  children: [
                    TextSpan(
                      text: '/${controller.questions.length.toString().enNumToBeNum}',
                      style: AppTextStyles.regular16
                          .copyWith(
                        fontSize: 15.sp,
                        color: AppColors.black,
                      ),
                    ),
                  ]),
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
