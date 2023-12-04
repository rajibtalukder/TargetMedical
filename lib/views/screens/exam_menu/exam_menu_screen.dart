import 'package:target_medical/target_medical.dart';
import 'package:target_medical/controllers/exam_menu_screen_controller.dart';
import 'package:target_medical/controllers/get_controllers.dart';
import 'package:get/get.dart';
import 'package:target_medical/models/chapter_model.dart';
import 'package:target_medical/models/exam_model.dart';
import 'package:target_medical/views/widgets/widget_loading.dart';
import 'package:target_medical/views/widgets/custom_tab_widget.dart';

class ExamMenuScreen extends StatelessWidget {
  ExamMenuScreen({Key? key}) : super(key: key);

  final ExamMenuScreenController controller =
      GetControllers.instance.getExamMenuScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarStyles.white,
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            headerWidget(context),
            Obx(() {
              if (controller.subjects.isEmpty) {
                return Container();
              }
              return CustomTabWidget(
                subjects: controller.subjects,
                onPressedTab: (subject) {
                  controller.onTapSubject(subject);
                },
              );
            }),
            bodyWidget(),
          ],
        ),
      ),
    );
  }

  Widget headerWidget(context) {
    return Obx(() {
      return Container(
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
                    // 'বিষয়ভিত্তিক পরীক্ষা',
                    controller.currentType.value.examTypeName!,
                    style: AppTextStyles.semiBold20.copyWith(
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    controller.subTitle.value,
                    style: AppTextStyles.semiBold11.copyWith(color: AppColors.black),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
          ],
        ),
      );
    });
  }

  Widget bodyWidget() {
    return Obx(() {
      return Expanded(
        child: WidgetLoading(
          loading: controller.loading,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.h),
                  Text(
                    controller.bodyTitle.value,
                    style: AppTextStyles.semiBold16,
                  ),
                  SizedBox(height: 12.h),
                  controller.isSubjective.isTrue
                      ? Column(
                    children: [
                      for (int m = 0; m < controller.chapters.length; m++)
                        chapterItemWidget(
                          controller.chapters[m],
                        )
                    ],
                  )
                      : Column(
                    children: [
                      for (int n = 0; n < controller.exams.length; n++)
                        itemWidget(
                          controller.exams[n],
                        )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget itemWidget(
    ExamModel exam,
  ) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h),
      child: InkWell(
        onTap: () {
          controller.onPressedExam(exam);
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
                  exam.examName.toString(),
                  style: AppTextStyles.semiBold14.copyWith(color: AppColors.black),
                ),
              ),
              // const Spacer(),
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

  Widget chapterItemWidget(
    ChapterModel chapter,
  ) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h),
      child: InkWell(
        onTap: () {
          controller.onPressedChapter(chapter);
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
                  chapter.chapterBnName.toString(),
                  style: AppTextStyles.semiBold14.copyWith(color: AppColors.black),
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
