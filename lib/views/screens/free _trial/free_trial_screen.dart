import 'package:get/get.dart';
import 'package:target_medical/views/screens/main/main_screen.dart';

import '../../../controllers/get_controllers.dart';
import '../../../target_medical.dart';

class FreeTrialScreen extends StatelessWidget {
  FreeTrialScreen({super.key});

  final durationController =
      GetControllers.instance.getFreeTrialDurationController();

  final userController = GetControllers.instance.getUserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarStyles.white,
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: Obx(
            () => Column(
              children: [
                durationController.isLoading.isTrue
                    ? Container()
                    : checkResultItemWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget checkResultItemWidget() {
    return Padding(
      padding: EdgeInsets.only(top: 8.h),
      child: InkWell(
        onTap: () async {},
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: AppColors.white2,
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 70.h,
                  child: Expanded(
                    child: Text(
                      durationController.freeDuration!.data.description,
                      style: AppTextStyles.semiBold14
                          .copyWith(color: AppColors.black),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                InkWell(
                  onTap: () {
                    durationController.postFreeTrial(
                        durationController.freeDuration!.data.duration).then((value) {
                          userController.getProfileData();
                          Get.offAll(MainScreen());
                          AppKeys.scaffoldKey.currentState?.closeEndDrawer();
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 16.h,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.blue,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          spreadRadius: 0,
                          offset: Offset(0, 1.h),
                          color: AppColors.black.withOpacity(0.25),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Text(
                      'সাবমিট ',
                      style: AppTextStyles.title.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

// Row(
// children: [
// Expanded(
// child: Text('jjj',
// style:
// AppTextStyles.semiBold14.copyWith(color: AppColors.black),
// ),
// ),
// //const Spacer(),
// SvgPicture.asset(
// AppIcons.forwardArrow,
// color: AppColors.black,
// width: 24.h,
// height: 24.h,
// ),
// ],
// ),
