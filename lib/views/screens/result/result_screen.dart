import 'package:get/get.dart';

import '../../../controllers/check_result_screen_controller.dart';
import '../../../controllers/get_controllers.dart';
import '../../../target_medical.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  static final CheckResultScreenController checkResultController =
      GetControllers.instance.getCheckResultController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarStyles.white,
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.h),
              child: titleBarWidget(),
            ),
            for(int i=0; i<checkResultController.checkResultList.length;i++)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                child: resultItemWidget(i),
              )
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            //   child: ListView.builder(
            //       shrinkWrap: true,
            //       itemCount: checkResultController.checkResultList.length,
            //       itemBuilder: (context, index) {
            //         return resultItemWidget(index);
            //       }),
            // )
          ],
        ),
      ),
    );
  }

  Widget titleBarWidget() {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Get.back();
          },
          child: SvgPicture.asset(
            AppIcons.backArrow,
            color: AppColors.black,
            height: 24.h,
            width: 24.h,
          ),
        ),
        SizedBox(width: 18.w),
        Text(
          'Check Result',
          style: AppTextStyles.semiBold18.copyWith(color: AppColors.black),
        ),
      ],
    );
  }

  Widget resultItemWidget(int index) {
    return Obx(
      () => Container(
        margin: EdgeInsets.all(10.h),
        padding: EdgeInsets.all(10.h),
        decoration: BoxDecoration(
            color: AppColors.lightGray,
            borderRadius: BorderRadius.circular(10.r)),
        child: Column(
          children: [
            Row(
              children: [
                const Text('Position : '),
                Text('${index + 1}', style: AppTextStyles.number),
              ],
            ),
            Row(
              children: [
                const Text('Student Name : '),
                Text(checkResultController.checkResultList[index].name,
                    style: AppTextStyles.number),
              ],
            ),
            Row(
              children: [
                const Text('Total Questions : '),
                Text(
                    checkResultController.checkResultList[index].examTotalMark
                        .toString(),
                    style: AppTextStyles.number),
              ],
            ),
            Row(
              children: [
                const Text('Correct : '),
                Text(
                    checkResultController.checkResultList[index].userMark
                        .toString(),
                    style: AppTextStyles.number),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
