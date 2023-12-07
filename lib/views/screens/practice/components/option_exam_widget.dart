import 'package:get/get.dart';
import 'package:target_medical/controllers/get_controllers.dart';
import 'package:target_medical/controllers/practice_screen_controller.dart';
import 'package:target_medical/target_medical.dart';
import 'package:target_medical/models/exam_type_model.dart';
import 'package:target_medical/views/screens/exam_menu/exam_menu_screen.dart';

import '../../../../controllers/user_controller.dart';

class OptionExamWidget extends StatelessWidget {
  final String title;
  final bool isBGJ;

  OptionExamWidget({
    Key? key,
    required this.title,
    required this.isBGJ,
  }) : super(key: key);

  final PracticeScreenController controller =
      GetControllers.instance.getPracticeScreenController();
  final UserController userController =
      GetControllers.instance.getUserController();
  int paidId = 0;

  @override
  Widget build(BuildContext context) {
    paidId = userController.userData.isPaid!;
    return Obx(() {
      if (controller.examController.examTypes.isEmpty) {
        return Container();
      }
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 14.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.semiBold16,
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                itemWidget(
                    type: controller.examController.examTypes[0],
                    onPressed: (type) {
                      controller.subjectWiseExamScreenController.setType(
                        type,
                        title,
                        'অধ্যায়সমূহ',
                        isBGJ,
                        true,
                      );
                      // userController.userData.isPaid == 0
                      //     ? Get.to(() => BuyPackageScreen())
                      //     : Get.to(() => ExamMenuScreen());
                      if (paidId == 0) {
                        Get.to(() => ExamMenuScreen());
                      } else if (paidId % 2 != 0 && !isBGJ) {
                        Get.to(() => ExamMenuScreen());
                      } else if (paidId % 2 == 0 && isBGJ) {
                        Get.to(() => ExamMenuScreen());
                      }
                    }),
                SizedBox(width: 24.w),
                itemWidget(
                    type: controller.examController.examTypes[1],
                    isFree: true,
                    onPressed: (type) {
                      controller.subjectWiseExamScreenController.setType(
                        type,
                        title,
                        'সালভিত্তিক প্রশ্নাবলি',
                        isBGJ,
                        false,
                      );
                      Get.to(() => ExamMenuScreen());
                    }),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                itemWidget(
                    type: controller.examController.examTypes[2],
                    onPressed: (type) {
                      controller.subjectWiseExamScreenController.setType(
                        type,
                        title,
                        'মডেল টেস্ট সমূহ',
                        isBGJ,
                        false,
                      );
                      // userController.userData.isPaid == 0
                      //     ? Get.to(() => BuyPackageScreen())
                      //     : Get.to(() => ExamMenuScreen());
                      if (paidId == 0) {
                        Get.to(() => ExamMenuScreen());
                      } else if (paidId % 2 != 0 && !isBGJ) {
                        Get.to(() => ExamMenuScreen());
                      } else if (paidId % 2 == 0 && isBGJ) {
                        Get.to(() => ExamMenuScreen());
                      }
                    }),
                SizedBox(width: 24.w),
                itemWidget(
                    type: controller.examController.examTypes[3],
                    onPressed: (type) {
                      controller.subjectWiseExamScreenController.setType(
                        type,
                        title,
                        'অধ্যায়সমূহ',
                        isBGJ,
                        true,
                      );
                      // userController.userData.isPaid == 0
                      //     ? Get.to(() => BuyPackageScreen())
                      //     : Get.to(() => ExamMenuScreen());
                      if (paidId == 0) {
                        Get.to(() => ExamMenuScreen());
                      } else if (paidId % 2 != 0 && !isBGJ) {
                        Get.to(() => ExamMenuScreen());
                      } else if (paidId % 2 == 0 && isBGJ) {
                        Get.to(() => ExamMenuScreen());
                      }
                    }),
              ],
            ),
          ],
        ),
      );
    });
  }

  Widget itemWidget({
    required ExamTypeModel type,
    Function(ExamTypeModel type)? onPressed,
    bool isFree = false,
  }) {
    return Expanded(
      child: InkWell(
        onTap: () {
          if (onPressed != null) {
            onPressed(type);
          }
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.white,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    getIcon(type.examTypeId!),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    type.examTypeName!,
                    style: AppTextStyles.regular12,
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0,
              child: isFree
                  ? Container(
                      height: 20.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                          color: AppColors.pink,
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Center(
                        child: Text('Free',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 14.sp,
                              fontFamily: AppFonts.liAdorNoirritRegular,
                              fontWeight: FontWeight.w400,
                            )),
                      ),
                    )
                  : const SizedBox(),
            )
          ],
        ),
      ),
    );
  }

  String getIcon(int index) {
    switch (index) {
      case 1:
        return AppIcons.subjectiveTest;
      case 2:
        return AppIcons.questionBank;

      case 3:
        return AppIcons.modelTest;
      case 4:
        return AppIcons.practice1;

      default:
        return '';
    }
  }
}
