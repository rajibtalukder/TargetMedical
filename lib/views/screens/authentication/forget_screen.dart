import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_icons.dart';
import '../../../constants/app_logos.dart';
import '../../../controllers/authentication_screen_controller.dart';
import '../../../controllers/get_controllers.dart';
import '../../styles/app_bar_styles.dart';
import '../../styles/text_field_styles.dart';
import 'otp_screen.dart';

class ForgetScreen extends StatelessWidget {
  ForgetScreen({super.key});

  final AuthenticationScreenController controller =
  GetControllers.instance.getAuthenticationScreenController();
  TextEditingController forgotController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppAppBarStyles.transparent,
      body: Column(
        children: [
          Container(
            height: 250.h,
            margin: EdgeInsets.only(
              left: 14.w,
              right: 14.w,
              bottom: 20.h,
            ),
            decoration: BoxDecoration(
              color: AppColors.lightBlueAccent,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(17.r),
              ),
            ),
            alignment: Alignment.center,
            child: Image.asset(
              AppLogos.logo,
              width: 100.w,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60.w),
            child: Column(
              children: [
                SizedBox(height: 34.h),
                AppTextFieldStyles.number(
                    hint: 'Enter your phone number',
                    controller: forgotController),
                SizedBox(height: 24.h),
                InkWell(
                  onTap: () {
                    controller.forgetPassword(forgotController.text);
                    Get.to(const OTPScreen());
                  },
                  child: Container(
                    padding:
                    EdgeInsets.symmetric(vertical: 5.h, horizontal: 12.w),
                    decoration: BoxDecoration(
                      color: AppColors.blue,
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                    child: RotatedBox(
                      quarterTurns: 2,
                      child: SvgPicture.asset(
                        AppIcons.backArrow,
                        color: Colors.white,
                        width: 24.h,
                        height: 24.h,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
