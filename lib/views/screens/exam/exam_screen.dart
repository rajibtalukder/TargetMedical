import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:target_medical/extensions/extension.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_icons.dart';
import '../../../controllers/exam_screen_controller.dart';
import '../../../controllers/get_controllers.dart';
import '../../../models/question_model.dart';
import '../../dialogs/alert_dialog_loader.dart';
import '../../dialogs/confirmation_dialog.dart';
import '../../styles/text_styles.dart';
import '../../widgets/widget_loading.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({Key? key}) : super(key: key);

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  final ExamScreenController controller =
      GetControllers.instance.getExamScreenController();
  final profileController = GetControllers.instance.getProfileScreenController();

  @override
  void initState() {
    controller.inIt();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
        // return AlertDialogLoader.load(
        //   dialog: ConfirmationDialog(
        //     title: "Cancel Exam",
        //     massage:
        //         'Are you absolutely certain that you wish to cancel the exam?',
        //     onPressed: () {
        //       controller.cancelExam();
        //     },
        //   ),
        // );
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: Padding(
            padding: EdgeInsets.all(15.h),
            child: InkWell(
              onTap: () {
                AlertDialogLoader.load(
                  dialog: ConfirmationDialog(
                    title: "Cancel Exam",
                    massage:
                        'Are you absolutely certain that you wish to cancel the exam?',
                    onPressed: () {
                      controller.cancelExam();
                    },
                  ),
                );
              },
              child: SvgPicture.asset(
                AppIcons.close,
                color: AppColors.black,
                width: 24.h,
                height: 24.h,
              ),
            ),
          ),
          title: clockWidget(),
          centerTitle: true,
          backgroundColor: AppColors.white,
        ),
        backgroundColor: AppColors.gray,
        body: SafeArea(
            child: WidgetLoading(
          loading: controller.loading,
          child: SingleChildScrollView(
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SizedBox(
                  //     height: 500.h,
                  //     child: answerWidget()),
                  for (int i = 0; i < controller.questions.length; i++)
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 15.h),
                      height: 400.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(20.h),
                            width: double.infinity,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '${i + 1}.  ${controller.questions[i].ques?.data}',
                                    style: AppTextStyles.screenTitle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(thickness: 1,color: AppColors.gray),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30.w, vertical: 30.h),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  for (int j = 0; j < 4; j++)
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          controller.onTapQuestionNumber(i);
                                          controller.onSelectChoice(j);
                                          controller.selectedOptions[i] = j;
                                          controller.refresh();
                                        });
                                      },
                                      child: optionsWidget(
                                          controller
                                              .questions[i].option![j].data
                                              .toString(),
                                          i,
                                          j),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  InkWell(
                    onTap: () {
                      controller.onSubmit();
                      profileController.examHistoryList.refresh();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 18.h, horizontal: 33.w),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'সাবমিট',
                        style: AppTextStyles.buttonText.copyWith(
                          color: AppColors.blue,
                        ),
                      ),
                    ),
                  )
                  // clockWidget(),
                  // SizedBox(height: 36.h),
                  // QuestionNumberWidget(),
                  // SizedBox(height: 36.h),
                  // questionWidget(),
                  // SizedBox(height: 36.h),
                  // answerWidget(),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }

  Widget optionsWidget(String text, int i, int j) {
    final selectedOption = controller.selectedOptions[i];
    return Container(
      padding: EdgeInsets.all(10.h),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50.r)),
        color: selectedOption == j?AppColors.green2: AppColors.lightGray,
      ),
      child: Row(
        children: [
          Text('$j. '.enNumToEngLetter),
          Expanded(
            child: Text(
              text,
              style:AppTextStyles.widgetTitle,
            ),
          ),
        ],
      ),
    );
  }

  Widget questionWidget() {
    return Obx(() {
      if (controller.question.value.ques!.type == Type.IMAGE) {
        return Container(
          color: AppColors.black,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Text(
                      'প্রশ্নঃ',
                      style: AppTextStyles.widgetTitle,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.h),
                  child: CachedNetworkImage(
                    imageUrl: controller.question.value.ques!.data!,
                    width: 150.w,
                    height: 150.h,
                    fit: BoxFit.cover,
                    placeholder: (context, url) {
                      return Container(
                        width: 150.w,
                        height: 150.h,
                        decoration: BoxDecoration(
                            color: AppColors.lightGray,
                            borderRadius: BorderRadius.circular(8.r)),
                      );
                    },
                    errorWidget: (context, url, error) {
                      return Container(
                        width: 150.w,
                        height: 150.h,
                        decoration: BoxDecoration(
                            color: AppColors.lightGray,
                            borderRadius: BorderRadius.circular(8.r)),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      }
      return Container(
        color: AppColors.black,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Text(
                'প্রশ্নঃ  ${controller.question.value.ques!.data}',
                style: AppTextStyles.buttonText,
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget answerWidget() {
    return Expanded(
      child: Container(
        color: AppColors.blue,
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 16.h),
                  choiceWidget(),
                  SizedBox(height: 36.h),
                  Row(
                    children: [
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          controller.carouselController.previousPage();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: AppColors.white.withOpacity(0.25),
                            borderRadius: BorderRadius.circular(2.r),
                          ),
                          child: SvgPicture.asset(
                            AppIcons.backArrow,
                            color: AppColors.white,
                            height: 24.h,
                            width: 24.h,
                          ),
                        ),
                      ),
                      SizedBox(width: 20.w),
                      InkWell(
                        onTap: () {
                          controller.carouselController.nextPage();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(2.r),
                          ),
                          child: RotatedBox(
                            quarterTurns: 2,
                            child: SvgPicture.asset(
                              AppIcons.backArrow,
                              color: AppColors.blue,
                              height: 24.h,
                              width: 24.h,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 36.h),
            Obx(() {
              return Visibility(
                visible: controller.showSubmitButton.value,
                child: InkWell(
                  onTap: () {
                    controller.onSubmit();
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 18.h, horizontal: 33.w),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'সাবমিট',
                      style: AppTextStyles.buttonText.copyWith(
                        color: AppColors.blue,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget choiceWidget() {
    return Flexible(
      child: SingleChildScrollView(
        child: Wrap(
          spacing: 16.w,
          children: [
            choiceItemWidget(
              index: 0,
            ),
            choiceItemWidget(
              index: 1,
            ),
            choiceItemWidget(
              index: 2,
            ),
            choiceItemWidget(
              index: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget choiceItemWidget({
    required int index,
  }) {
    return Obx(() {
      final data = controller.question.value.option![index];

      if (controller.isSelectAnyChoice.isFalse) {
        return unselectedChoiceWidget(option: data, index: index);
      }
      if (controller.selectedChoiceIndex.value == index) {
        return selectedChoiceWidget(option: data);
      }

      return unselectedChoiceWidget(option: data, index: index);
    });
  }

  Widget selectedChoiceWidget({
    required Option option,
  }) {
    if (option.type == Type.IMAGE) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Stack(
          children: [
            Container(
              width: 150.w,
              height: 130.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(8.h),
                ),
              ),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 4.w,
                      color: AppColors.blueAccent,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(8.h),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: option.data.toString(),
                        width: 146.w,
                        height: 130.h,
                        fit: BoxFit.cover,
                        placeholder: (context, url) {
                          return Container(
                            width: 146.w,
                            height: 130.h,
                            decoration: BoxDecoration(
                                color: AppColors.lightGray,
                                borderRadius: BorderRadius.circular(8.r)),
                          );
                        },
                        errorWidget: (context, url, error) {
                          return Container(
                            width: 146.w,
                            height: 130.h,
                            decoration: BoxDecoration(
                                color: AppColors.lightGray,
                                borderRadius: BorderRadius.circular(8.r)),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              width: 150.w,
              height: 130.h,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(8.h),
                  ),
                  color: AppColors.black.withOpacity(0.6),
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.check_rounded,
                  color: AppColors.white,
                ),
              ),
            )
          ],
        ),
      );
    }

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.horizontal(
          right: Radius.circular(100),
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 4.w,
              color: AppColors.blueAccent,
            ),
            SizedBox(width: 24.w),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Text(
                  option.data.toString(),
                  style: AppTextStyles.widgetTitle.copyWith(
                    color: AppColors.blue,
                  ),
                ),
              ),
            ),
            SizedBox(width: 16.w),
          ],
        ),
      ),
    );
  }

  Widget unselectedChoiceWidget({
    required Option option,
    required int index,
  }) {
    if (option.type == Type.IMAGE) {
      return InkWell(
        onTap: () {
          controller.onSelectChoice(index);
        },
        child: Container(
          width: 150.w,
          height: 130.h,
          margin: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.horizontal(
              right: Radius.circular(8.h),
            ),
          ),
          child: IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 4.w,
                  color: AppColors.white,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(8.h),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: option.data.toString(),
                    width: 146.w,
                    height: 130.h,
                    fit: BoxFit.cover,
                    placeholder: (context, url) {
                      return Container(
                        width: 146.w,
                        height: 130.h,
                        decoration: BoxDecoration(
                            color: AppColors.lightGray,
                            borderRadius: BorderRadius.circular(8.r)),
                      );
                    },
                    errorWidget: (context, url, error) {
                      return Container(
                        width: 146.w,
                        height: 130.h,
                        decoration: BoxDecoration(
                            color: AppColors.lightGray,
                            borderRadius: BorderRadius.circular(8.r)),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return InkWell(
      onTap: () {
        controller.onSelectChoice(index);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
          color: AppColors.white.withOpacity(0.25),
          borderRadius: const BorderRadius.horizontal(
            right: Radius.circular(100),
          ),
        ),
        clipBehavior: Clip.hardEdge,
        child: IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: 4.w,
                color: AppColors.white,
              ),
              SizedBox(width: 24.w),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Text(
                    option.data.toString(),
                    style: AppTextStyles.widgetTitle.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
            ],
          ),
        ),
      ),
    );
  }

  Widget clockWidget() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          AppIcons.clock,
          width: 24.h,
          height: 24.h,
          color: AppColors.green,
        ),
        SizedBox(width: 10.w),
        Obx(() {
          return Text(
            controller.timeDisplayText.value,
            style: AppTextStyles.widgetTitle.copyWith(
              color: AppColors.green,
              fontSize: 18.sp,
            ),
          );
        }),
      ],
    );
  }
}
