import 'package:cached_network_image/cached_network_image.dart';
import 'package:target_medical/target_medical.dart';
import 'package:target_medical/controllers/profile_screen_controller.dart';
import 'package:target_medical/controllers/get_controllers.dart';
import 'package:get/get.dart';
import 'package:target_medical/views/screens/edit_profile/edit_profile_screen.dart';
import 'components/profile_courses_widget.dart';
import 'components/profile_dashboard_widget.dart';
import 'components/profile_history_widget.dart';
import 'components/profile_self_widget.dart';
import 'components/profile_tab_widget.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final ProfileScreenController controller =
      GetControllers.instance.getProfileScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarStyles.white,
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 16.h),
              headerWidgetWidget(),
              Obx(()=> Row(
                  children: [
                    Text(
                      'Expire date : ',
                      style: AppTextStyles.semiBold16,
                    ),
                    SizedBox(width: 10.w),
                    controller.isLoading.isTrue?Text('',
                      style: AppTextStyles.semiBold16,
                    ):Expanded(
                      child: Text(controller.expireDateModel.data!.expireDate.isNull?'You didn\'t buy any package':
                        controller.expireDateModel.data!.expireDate.toString(),
                        style: AppTextStyles.semiBold16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              ProfileTabWidget(
                screens: [
                  ProfileDashboardWidget(),
                  ProfileCoursesWidget(),
                  ProfileHistoryWidget(),
                  ProfileSelfWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget headerWidgetWidget() {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          imageWidget(),
          SizedBox(width: 15.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.userController.userData.name.toString(),
                  style: AppTextStyles.semiBold15.copyWith(

                    color: AppColors.black,
                  ),
                ),
                Text(
                  'ID : #${controller.userController.userData.userId.toString().padLeft(6, '0')}',
                  style: AppTextStyles.semiBold11.copyWith(
                    fontSize: 13.sp,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(() => EditProfileScreen());
            },
            child: SvgPicture.asset(
              AppIcons.edit,
              width: 24.h,
              height: 24.h,
            ),
          ),
        ],
      );
    });
  }

  Widget imageWidget() {
    return Obx(() {
      if (controller.userController.userData.image!.isNotEmpty) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: CachedNetworkImage(
            imageUrl: controller.userController.userData.image!,
            placeholder: (context, url) {
              return Container(
                height: 38.h,
                width: 38.h,
                color: AppColors.lightGray,
              );
            },
            errorWidget: (context, url, error) {
              return Container(
                height: 38.h,
                width: 38.h,
                color: AppColors.lightGray,
              );
            },
            height: 38.h,
            width: 38.h,
            fit: BoxFit.cover,
          ),
        );
      }

      return ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.asset(
          AppImages.pp,
          width: 110.h,
          height: 110.h,
          fit: BoxFit.fill,
        ),
      );
    });
  }
}
