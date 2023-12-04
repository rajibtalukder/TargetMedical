import 'package:target_medical/target_medical.dart';
import 'package:target_medical/controllers/authentication_screen_controller.dart';
import 'package:target_medical/controllers/get_controllers.dart';

import 'components/login_widget.dart';
import 'components/register_widget.dart';

class AuthenticationScreen extends StatelessWidget {
  AuthenticationScreen({Key? key}) : super(key: key);

  final AuthenticationScreenController controller =
      GetControllers.instance.getAuthenticationScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppAppBarStyles.transparent,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SizedBox(
          height: AppSize.height,
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: 14.w,
                        right: 14.w,
                        bottom: 20.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white2,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(17.r),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Image.asset(
                        AppLogos.logo,
                        width: 190.w,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: tabButtonWidget(),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 6,
                child: PageView.builder(
                  controller: controller.pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    if (index == 1) {
                      return RegisterWidget();
                    }
                    return LoginWidget();
                  },
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget tabButtonWidget() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              spreadRadius: 0,
              offset: Offset(0, 1.h),
              color: AppColors.black.withOpacity(0.25),
            ),
          ],
          borderRadius: BorderRadius.circular(100),
        ),
        child: ValueListenableBuilder(
          valueListenable: controller.currentIndex,
          builder: (context, value, child) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                buttonStyle('Log in', 0),
                buttonStyle('Register', 1),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buttonStyle(name, index) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 280),
      child: index == controller.currentIndex.value
          ? Container(
              color: AppColors.black,
              width: 110.w,
              height: 40.h,
              alignment: Alignment.center,
              child: Text(
                name,
                style: AppTextStyles.semiBold15.copyWith(
                  color: AppColors.white,
                ),
              ),
            )
          : InkWell(
              onTap: () {
                controller.currentIndex.value = index;
                controller.pageController.jumpToPage(index);
              },
              child: Container(
                color: AppColors.white,
                width: 110.w,
                height: 40.h,
                alignment: Alignment.center,
                child: Text(
                  name,
                  style: AppTextStyles.semiBold15
                      .copyWith(color: AppColors.black),
                ),
              ),
            ),
    );
  }
}
