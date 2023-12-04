import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_icons.dart';
import '../../../constants/app_logos.dart';
import '../../../controllers/authentication_screen_controller.dart';
import '../../../controllers/get_controllers.dart';
import '../../styles/text_field_styles.dart';
import 'authentication_screen.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final AuthenticationScreenController controller =
  GetControllers.instance.getAuthenticationScreenController();

  TextEditingController newPassController = TextEditingController();
  TextEditingController conPassController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SingleChildScrollView(
        child: Column(
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
                  AppTextFieldStyles.password(
                      hint: 'Enter New Password',
                      controller: newPassController),
                  SizedBox(height: 34.h),
                  AppTextFieldStyles.password(
                      hint: 'Enter Confirm Password',
                      controller: conPassController),
                  SizedBox(height: 50.h),
                  InkWell(
                    onTap: () {
                      if(newPassController.text==conPassController.text){
                        controller.setNewPassword(conPassController.text);
                        Get.to(AuthenticationScreen());
                      }else{
                        print('Password does not match');
                      }
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
      ),
    );
  }
}
