import 'package:target_medical/target_medical.dart';
import 'package:target_medical/controllers/forget_password_screen_controller.dart';
import 'package:target_medical/controllers/get_controllers.dart';
import 'package:get/get.dart';
import 'package:target_medical/views/screens/forget_password/components/foeget_password_widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);

  final ForgetPasswordScreenController controller =
      GetControllers.instance.getForgetPasswordScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarStyles.white,
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 14.w,
                      right: 14.w,
                      bottom: 40.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white2,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(17.r),
                      ),
                    ),
                    alignment: Alignment.center,
                    child:Image.asset(
                      AppLogos.logo,
                      width: 190.w,
                    ),
                  ),
                  Positioned(
                    left: 35,
                    top: 30,
                    child: SvgPicture.asset(
                      AppIcons.backArrow,
                      height: 24.h,
                      width: 24.h,
                    ),
                  ),
                ],
              ),
            ),
            ForgetPasswordWidget(),
          ],
        ),
      ),
    );
  }
}
