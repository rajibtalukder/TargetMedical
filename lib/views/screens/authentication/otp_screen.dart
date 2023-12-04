// ignore_for_file: file_names, use_build_context_synchronously
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_icons.dart';
import '../../../controllers/authentication_screen_controller.dart';
import '../../../controllers/get_controllers.dart';
import 'new_password_screen.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({
    super.key,
  });

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {

  final AuthenticationScreenController controller =
  GetControllers.instance.getAuthenticationScreenController();

  TextEditingController otpController = TextEditingController();
  String numberText = "";
  int count = 120;
  bool isCountDone = false;

  @override
  void initState() {
    super.initState();
    countDown();
  }

  void countDown() {
    debugPrint("Started");
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (count > 0) {
        setState(() {
          count--;
          debugPrint(count.toString());
        });
      } else {
        timer.cancel();
        setState(() {
          isCountDone = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //welcomeText(),
            welcomeText2(),
            SizedBox(height: 30.h),
            otpField(context),
            SizedBox(height: 60.h),
            InkWell(
              onTap: () {
                if(controller.getOtp==otpController.text){
                  Get.to(const NewPasswordScreen());
                }
                else{
                  Get.back();
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
            SizedBox(height: 30.h),
          ],
        ));
  }

  Widget otpField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.w),
      child: OTPTextField(
        length: 6,
        width: MediaQuery.of(context).size.width,
        fieldWidth: 40,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
        textFieldAlignment: MainAxisAlignment.spaceAround,
        fieldStyle: FieldStyle.box,
        otpFieldStyle: OtpFieldStyle(
          disabledBorderColor: const Color(0xffF0787E),
          borderColor: const Color(0xffF0787E),
          enabledBorderColor: const Color(0xffF0787E),
          focusBorderColor: const Color(0xffF0787E),
          errorBorderColor: const Color(0xffF0787E),
        ),
        onCompleted: (pin) {
          setState(() {
            otpController.text = pin;
          });
        },
      ),
    );
  }

  Widget welcomeText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "ওটিপি",
          style: TextStyle(
            fontSize: 40.sp,
            fontFamily: 'custom',
            fontWeight: FontWeight.w600,
            color: const Color(0xffE51C26),
          ),
        ),
      ],
    );
  }

  Widget welcomeText2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "OTP verification",
          style: TextStyle(
            fontSize: 24.sp,
            fontFamily: 'custom',
            fontWeight: FontWeight.w400,
            color: const Color(0xff343434),
          ),
        ),
      ],
    );
  }
}
