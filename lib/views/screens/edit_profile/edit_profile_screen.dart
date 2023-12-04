import 'package:cached_network_image/cached_network_image.dart';
import 'package:target_medical/target_medical.dart';
import 'package:target_medical/controllers/edit_profile_screen_controller.dart';
import 'package:target_medical/controllers/get_controllers.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);

  final EditProfileScreenController controller =
      GetControllers.instance.getEditProfileScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            headerWidget(context),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: ListView(
                  children: [
                    SizedBox(height: 24.h),
                    imageWidget(),
                    SizedBox(height: 24.h),
                    Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          AppTextFieldStyles.text(
                            hint: 'নাম',
                            outline: true,
                            controller: controller.nameController,
                          ),
                          SizedBox(height: 16.h),
                          AppTextFieldStyles.email(
                            hint: 'ইমেইল ',
                            outline: true,
                            controller: controller.emailController,
                          ),
                          SizedBox(height: 16.h),
                          AppTextFieldStyles.dob(
                            hint: 'জন্মদিন',
                            outline: true,
                            controller: controller.dobController,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height:24.h),
                    InkWell(
                      onTap: (){
                        controller.submit();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: AppColors.black,
                        ),
                        child: Text('সাবমিট',
                            style: AppTextStyles.semiBold16.copyWith(
                              color: AppColors.white,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget headerWidget(context) {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: SvgPicture.asset(
              AppIcons.backArrow,
              color: AppColors.black,
              width: 24.h,
              height: 24.h,
            ),
          ),
          SizedBox(width: 24.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'এডিট প্রোফাইল',
                  style: AppTextStyles.semiBold20.copyWith(
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  'ID : #${controller.userController.userData.userId.toString().padLeft(6, '0')}',
                  style: AppTextStyles.semiBold11.copyWith(
                    fontSize: 13.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }

  Widget imageWidget() {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Stack(
            fit: StackFit.loose,
            children: [
              Obx(() {
                if (controller.selectedImage.value != null) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.file(
                        File(controller.selectedImage.value!.path),
                        width: 110.h,
                        height: 110.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }

                if (controller.userController.userData.image!.isNotEmpty) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                        imageUrl: controller.userController.userData.image!,
                        placeholder: (context, url) {
                          return Container(
                            width: 110.h,
                            height: 110.h,
                            color: AppColors.lightGray,
                          );
                        },
                        errorWidget: (context, url, error) {
                          return Container(
                            width: 110.h,
                            height: 110.h,
                            color: AppColors.lightGray,
                          );
                        },
                        width: 110.h,
                        height: 110.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      AppImages.pp,
                      width: 110.h,
                      height: 110.h,
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              }),
              Positioned(
                right: 0,
                top: 4.h,
                child: InkWell(
                  onTap: () {
                    controller.onSelectImage();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 8.h,
                    ),
                    width: 42.h,
                    height: 42.h,
                    decoration: BoxDecoration(
                        color: AppColors.gray,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.white,
                        )),
                    child: SvgPicture.asset(
                      AppIcons.camera,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Obx(() {
        //   return Visibility(
        //     visible: controller.showImageError.value,
        //     child: Text(
        //       'Please Select Image',
        //       style: AppTextStyles.title03.copyWith(
        //         color: Colors.red,
        //       ),
        //     ),
        //   );
        // })
      ],
    );
  }
}
