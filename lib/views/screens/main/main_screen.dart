import 'package:target_medical/target_medical.dart';
import 'package:target_medical/controllers/main_screen_controller.dart';
import 'package:target_medical/controllers/get_controllers.dart';
import 'package:get/get.dart';
import 'package:target_medical/views/screens/free%20_trial/free_trial_screen.dart';
import 'package:target_medical/views/screens/home/home_screen.dart';
import 'package:target_medical/views/screens/packages/packages_screen.dart';
import 'package:target_medical/views/screens/practice/practice_screen.dart';
import 'package:target_medical/views/screens/profile/profile_screen.dart';
import 'package:target_medical/views/screens/resource/resource_screen.dart';
import 'package:target_medical/views/screens/social_media/social_media_screen.dart';
import 'package:target_medical/views/screens/terms_and_condition/terms_and_condition_screen.dart';
import 'package:target_medical/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:target_medical/views/widgets/custom_images.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final MainScreenController controller =
      GetControllers.instance.getMainScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarStyles.white,
      backgroundColor: AppColors.white,
      key: AppKeys.scaffoldKey,
      endDrawer: sideDrawerWidget(context),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller.navController.pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return HomeScreen();
                  case 1:
                    return PracticeScreen();
                  case 2:
                    return ResourceScreen();
                  case 3:
                    return ProfileScreen();
                  default:
                    return const Placeholder();
                }
              },
            ),
          ),
          navigationBarWidget(),
        ],
      ),
    );
  }

  CustomBottomNavigationBar navigationBarWidget() {
    return CustomBottomNavigationBar(
      controller: controller.navController,
      backgroundColor: AppColors.white,
      height: 80.h,
      items: [
        CustomBNBItem(
          icon: AppIcons.homeFill,
          inactiveIcon: AppIcons.home,
          title: 'হোম',
        ),
        CustomBNBItem(
          icon: AppIcons.practiceFill,
          inactiveIcon: AppIcons.practice,
          title: 'প্র্যাক্টিস',
        ),
        CustomBNBItem(
          icon: AppIcons.resourceFill,
          inactiveIcon: AppIcons.resource,
          title: 'রিসোর্স',
        ),
        CustomBNBItem(
          icon: AppIcons.profileFill,
          inactiveIcon: AppIcons.profile,
          title: 'প্রোফাইল',
        ),
      ],
      activeStyle: (item) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                item.icon,
                width: 28.h,
                height: 28.h,
              ),
              SizedBox(height: 4.h),
              Text(
                item.title,
                style: AppTextStyles.semiBold15.copyWith(
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        );
      },
      inactiveStyle: (item) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                item.inactiveIcon,
                width: 28.h,
                height: 28.h,
              ),
              SizedBox(height: 4.h),
              Text(
                item.title,
                style: AppTextStyles.semiBold15.copyWith(
                  color: AppColors.gray,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget sideDrawerWidget(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      width: AppSize.widthPercentage(73),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 56.h),
            InkWell(
              onTap: () {
                AppKeys.scaffoldKey.currentState?.closeEndDrawer();
              },
              child: Icon(
                Icons.close_rounded,
                color: AppColors.black,
                size: 24.h,
              ),
            ),
            SizedBox(height:16.h),
            drawerItemWidget(
              icon: AppIcons.discount,
              title: 'প্যাকেজসমূহ',
              onPressed: (){
                Get.to(() => PackagesScreen());
              }
            ),
            drawerItemWidget(
              icon: AppIcons.socialMedia,
              title: 'সোশ্যাল মিডিয়া',
                onPressed: (){
                  Get.to(() => SocialMediaScreen());
                }
            ),
            drawerItemWidget(
              icon: AppIcons.terms,
              //title: 'নিয়মকানুন ও শর্তাবলী',
              title: 'আমাদের সম্পর্কে',
                onPressed: (){
                  Get.to(() => TermsAndConditionScreen());
                }
            ),
            drawerItemWidget(
                icon: AppIcons.discount,
                title: 'ফ্রি ট্রায়াল',
                onPressed: (){
                  Get.to(() => FreeTrialScreen());
                }
            ),
            // drawerItemWidget(
            //   icon: AppIcons.share2,
            //   title: 'শেয়ার করুন',
            //     onPressed: (){
            //       Get.to(() => TermsAndConditionScreen());
            //     }
            // ),
          ],
        ),
      ),
    );
  }

  Widget drawerItemWidget(
      {required String icon, required String title, Function? onPressed}) {
    return InkWell(
      onTap: () {
        onPressed!();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              icon,
              height: 20.h,
              width: 20.h,
            ),
            SizedBox(width: 8.w),
            Text(
              title,
              style: AppTextStyles.semiBold12,
            ),
          ],
        ),
      ),
    );
  }
}
