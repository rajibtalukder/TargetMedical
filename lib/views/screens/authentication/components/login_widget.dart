import 'package:get/get.dart';
import 'package:target_medical/controllers/authentication_screen_controller.dart';
import 'package:target_medical/controllers/get_controllers.dart';
import 'package:target_medical/target_medical.dart';
import 'package:target_medical/views/screens/forget_password/forget_password_screen.dart';

import '../forget_screen.dart';

class LoginWidget extends StatelessWidget {
  LoginWidget({Key? key}) : super(key: key);

  final AuthenticationScreenController controller =
      GetControllers.instance.getAuthenticationScreenController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 34.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60.w),
            child: Form(
              key: controller.logFormKey,
              child: Column(
                children: [
                  AppTextFieldStyles.number(
                      hint: 'Number',
                      controller: controller.logNumberController),
                  SizedBox(height: 24.h),
                  AppTextFieldStyles.password(
                      hint: 'Password',
                      controller: controller.logPasswordController),
                  SizedBox(height: 16.h),
                  GestureDetector(
                    onTap: (){
                      Get.to(ForgetScreen());
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forget password?',
                        style: AppTextStyles.semiBold12.copyWith(color: AppColors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 26.h),
          InkWell(
            onTap: () {
              controller.login();
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 12.w),
              decoration: BoxDecoration(
                color: AppColors.black,
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
          SizedBox(height: 24.h),
          // orWidget(),
          // SizedBox(height: 24.h),
          // facebookAndGoogleWidget(),
          SizedBox(height: 24.h),
          /*RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: 'By signing in, you agree to the ',
                style: AppTextStyles.semiBold11.copyWith(color: AppColors.gray),
                children: [
                  TextSpan(
                    text: 'Terms and Conditions',
                    style: AppTextStyles.semiBold11.copyWith(color: AppColors.black),
                  ),
                  TextSpan(
                    text: ',\n',
                    style:AppTextStyles.semiBold11.copyWith(color: AppColors.gray),
                  ),
                  TextSpan(
                    text: 'User Agreement',
                    style: AppTextStyles.semiBold11.copyWith(color: AppColors.black),
                  ),
                  TextSpan(
                    text: ' and ',
                    style:AppTextStyles.semiBold11.copyWith(color: AppColors.gray),
                  ),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: AppTextStyles.semiBold11.copyWith(color: AppColors.black),
                  ),
                ]),
          ),*/
        ],
      ),
    );
  }

  Widget orWidget() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 40.w,
          height: 1.h,
          color: AppColors.blueAccent,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text(
            'Or',
            style: AppTextStyles.semiBold14.copyWith(color: AppColors.blueAccent),
          ),
        ),
        Container(
          width: 40.w,
          height: 1.h,
          color: AppColors.blueAccent,
        ),
      ],
    );
  }

  Widget facebookAndGoogleWidget() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          AppIcons.facebookLogo,
          width: 35.h,
          height: 35.h,
        ),
        SizedBox(width: 16.w),
        SvgPicture.asset(
          AppIcons.googleLogo,
          width: 35.h,
          height: 35.h,
        ),
      ],
    );
  }
}
