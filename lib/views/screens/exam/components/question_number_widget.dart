import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:target_medical/controllers/exam_screen_controller.dart';
import 'package:target_medical/controllers/get_controllers.dart';
import 'package:target_medical/target_medical.dart';

class QuestionNumberWidget extends StatelessWidget {
  QuestionNumberWidget({
    Key? key,
  }) : super(key: key);

  final ExamScreenController controller =
      GetControllers.instance.getExamScreenController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              controller.carouselController.previousPage();
            },
            child: RotatedBox(
              quarterTurns: 2,
              child: SvgPicture.asset(
                AppIcons.forwardArrow,
                color: AppColors.gray,
                height: 24.h,
                width: 24.h,
              ),
            ),
          ),
          Expanded(
            child: CarouselSlider.builder(
              carouselController: controller.carouselController,
              options: CarouselOptions(
                height: 22.h,
                viewportFraction: 0.11,
                initialPage: 0,
                enableInfiniteScroll: true,
                autoPlay: false,
                scrollPhysics: const NeverScrollableScrollPhysics(),
                onPageChanged: (index, reason) {
                  controller.onTapQuestionNumber(index);
                },
              ),
              itemCount: controller.questions.length,
              itemBuilder: (context, index, realIndex) {
                return questionNumberItemWidget(index);
              },
            ),
          ),
          InkWell(
            onTap: () {
              controller.carouselController.nextPage();
            },
            child: SvgPicture.asset(
              AppIcons.forwardArrow,
              color: AppColors.gray,
              height: 24.h,
              width: 24.h,
            ),
          ),
        ],
      ),
    );
  }

  Widget questionNumberItemWidget(int index) {
    return InkWell(
      onTap: () {
        controller.carouselController.jumpToPage(index);
        controller.onTapQuestionNumber(index);
      },
      child: Obx(
        () {
          final question = controller.questions[index];
          Color borderColor = Colors.transparent;
          Color fontColor = Colors.transparent;
          Color fillColor = Colors.transparent;

          if (controller.currentIndex.value == index) {
            borderColor = AppColors.black;
            fontColor = AppColors.white;
            fillColor = AppColors.black;
          } else if (question.selectedAnsIndex != null) {
            borderColor = AppColors.black;
            fontColor = AppColors.black;
            fillColor = AppColors.white;
          } else {
            borderColor = AppColors.gray;
            fontColor = AppColors.gray;
            fillColor = AppColors.white;
          }

          return AnimatedScale(
            duration: const Duration(milliseconds: 180),
            scale: getScale(
                index: index,
                currentIndex: controller.currentIndex.value,
                length: 30),
            child: Container(
              height: 22.h,
              width: 22.h,
              decoration: BoxDecoration(
                  color: fillColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: borderColor,
                    width: 1.5.h,
                  )),
              alignment: Alignment.center,
              child: Text(
                (index + 1).toString().enNumToBeNum,
                style: AppTextStyles.regular12.copyWith(color: fontColor),
              ),
            ),
          );
        },
      ),
    );
  }

  double getScale(
      {required int index, required int currentIndex, required int length}) {
    if (currentIndex == index) {
      return 1.0;
    }
    final beforeIndex = currentIndex == 0 ? (length - 1) : (currentIndex - 1);
    if ((currentIndex + 1) == index || beforeIndex == index) {
      return 0.95;
    }
    if ((currentIndex + 2) == index || (beforeIndex - 1) == index) {
      return 0.9;
    }
    if ((currentIndex + 3) == index || (beforeIndex - 2) == index) {
      return 0.85;
    }
    return 0.8;
  }
}
