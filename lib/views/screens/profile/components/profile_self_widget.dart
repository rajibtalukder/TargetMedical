import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:target_medical/controllers/get_controllers.dart';
import 'package:target_medical/target_medical.dart';

import '../../authentication/authentication_screen.dart';

class ProfileSelfWidget extends StatelessWidget {
  ProfileSelfWidget({Key? key}) : super(key: key);

  final userController = GetControllers.instance.getUserController();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(height: 16.h),
          profilePhotoWidget(),
          infoWidget(
            title: 'নাম',
            value: userController.userData.name.toString(),
          ),
          infoWidget(
            title: 'জন্মদিন',
            value: userController.userData.dateOfBirth.toString(),
          ),
          infoWidget(
            title: 'ইমেইল',
            value: userController.userData.email.toString(),
          ),
          infoWidget(
            title: 'মোবাইল নং',
            value: userController.userData.mobile.toString(),
          ),
          InkWell(
            onTap: () async {
              await userController.clearOfflineData();
              Get.offAll(() => AuthenticationScreen());
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
                'লগ আউট',
                style: AppTextStyles.title.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget profilePhotoWidget() {
    return Column(
      children: [
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: Text(
                'প্রোফাইল ফটো',
                style: AppTextStyles.semiBold14.copyWith(
                  fontSize: 15,
                  color: AppColors.black,
                ),
              ),
            ),
            imageWidget(),
            // Container(
            //   height: 38.h,
            //   width: 38.h,
            //   decoration: BoxDecoration(
            //     color: AppColors.black.withOpacity(0.2),
            //     shape: BoxShape.circle,
            //   ),
            // ),
            // SvgPicture.asset(
            //   AppIcons.forwardArrow,
            //   width: 24.h,
            //   height: 24.h,
            //   color: AppColors.black.withOpacity(0.2),
            // ),
          ],
        ),
        SizedBox(height: 12.h),
        Divider(
          color: AppColors.custom('#D8D8D8').withOpacity(0.6),
          height: 1.h,
          thickness: 1.h,
        ),
      ],
    );
  }

  Widget infoWidget({required String title, required String value}) {
    return Column(
      children: [
        SizedBox(height: 24.h),
        Row(
          children: [
            Text(
              title,
              style: AppTextStyles.semiBold15.copyWith(

                color: AppColors.black,
              ),
            ),
            Expanded(
              child: Text(
                value,
                textAlign: TextAlign.end,
                style: AppTextStyles.semiBold15.copyWith(

                  color: AppColors.gray,
                ),
              ),
            ),
            // SizedBox(width: 10.w),
            // SvgPicture.asset(
            //   AppIcons.forwardArrow,
            //   width: 24.h,
            //   height: 24.h,
            //   color: AppColors.black.withOpacity(0.2),
            // ),
          ],
        ),
        SizedBox(height: 24.h),
        Divider(
          color: AppColors.custom('#D8D8D8').withOpacity(0.6),
          height: 1.h,
          thickness: 1.h,
        ),
      ],
    );
  }

  Widget imageWidget() {
    return Obx(() {
      if (userController.userData.image!.isNotEmpty) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: CachedNetworkImage(
            imageUrl: userController.userData.image!,
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
