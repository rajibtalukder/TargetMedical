import 'package:target_medical/target_medical.dart';
import 'package:target_medical/controllers/social_media_screen_controller.dart';
import 'package:target_medical/controllers/get_controllers.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaScreen extends StatelessWidget {
  SocialMediaScreen({Key? key}) : super(key: key);

  final SocialMediaScreenController controller =
      GetControllers.instance.getSocialMediaScreenController();

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
              SizedBox(height: 24.h),
              titleBarWidget(),
              SizedBox(height: 32.h),
              Expanded(
                child: SingleChildScrollView(
                  child: GetBuilder<SocialMediaScreenController>(
                      id: 'socialMediaUpdate',
                      builder: (context) {
                        return Column(
                          children: [
                            SizedBox(height: 12.h),
                            for (int i = 0;
                                i < controller.socialMediaList.length;
                                i++)
                              i == 0
                                  ? Padding(
                                      padding: EdgeInsets.only(bottom: 50.h),
                                      child: GestureDetector(
                                          onTap: () => launch(
                                              "tel://${controller.socialMediaList[i].linkOrNumber}"),
                                          child: emergencyCallWidget(controller
                                              .socialMediaList[i].linkOrNumber
                                              .toString())),
                                    )
                                  : GestureDetector(
                                      onTap: () async {
                                        String url = controller
                                            .socialMediaList[i].linkOrNumber
                                            .toString();
                                        if (await canLaunch(url)) {
                                          await launch(url);
                                        } else {
                                          throw 'Could not launch $url';
                                        }
                                      },
                                      child: socialMediaWidget(
                                        image: controller
                                            .socialMediaList[i].image.toString(),
                                        name: controller
                                            .socialMediaList[i].title
                                            .toString(),
                                        address: controller
                                            .socialMediaList[i].linkOrNumber
                                            .toString(),
                                      ),
                                    ),

                            /*SizedBox(height: 12.h),
                          socialMediaWidget(
                            image: AppIcons.fbPage,
                            name: 'Go to our facebook page',
                            address: 'target medical',
                          ),
                          SizedBox(height: 12.h),
                          socialMediaWidget(
                            image: AppIcons.fbGroup,
                            name: 'Go to our facebook group',
                            address: 'target medical',
                          ),
                          SizedBox(height: 12.h),
                          socialMediaWidget(
                            image: AppIcons.whatsapp,
                            name: 'Go to our whatsapp',
                            address: '+880 1xxxxxxxxx',
                          ),
                          SizedBox(height: 12.h),
                          socialMediaWidget(
                            image: AppIcons.youtube,
                            name: 'Go to our youtube channel',
                            address: 'target medical',
                          ),
                          SizedBox(height: 12.h),
                          socialMediaWidget(
                            image: AppIcons.linkin,
                            name: 'Go to our linkedin',
                            address: 'target medical',
                          ),
                          SizedBox(height: 12.h),
                          socialMediaWidget(
                            image: AppIcons.instagram,
                            name: 'Go to our instagram',
                            address: 'target medical',
                          ),*/
                          ],
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget titleBarWidget() {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Get.back();
          },
          child: SvgPicture.asset(
            AppIcons.backArrow,
            color: AppColors.black,
            height: 24.h,
            width: 24.h,
          ),
        ),
        SizedBox(width: 18.w),
        Text(
          'সোশ্যাল মিডিয়া',
          style: AppTextStyles.semiBold18.copyWith(color: AppColors.black),
        ),
      ],
    );
  }

  Widget emergencyCallWidget(String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: Offset(0.w, 2.h),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        children: [
          SvgPicture.asset(
            AppIcons.call,
            height: 50.h,
            width: 50.h,
          ),
          SizedBox(height: 12.h),
          Text(
            'Emergency Call',
            style: AppTextStyles.semiBold16.copyWith(color: AppColors.black),
          ),
          SizedBox(height: 12.h),
          Text(
            text,
            style: AppTextStyles.regular13.copyWith(color: AppColors.gray),
          ),
        ],
      ),
    );
  }

  Widget socialMediaWidget({
    required String image,
    required String name,
    required String address,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: AppColors.white2),
      ),
      child: Row(
        children: [
          Image.network(
            image,
            height: 30.h,
            width: 35.w,
          ),
          SizedBox(width: 28.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style:
                      AppTextStyles.semiBold16.copyWith(color: AppColors.black),
                ),
                Text(
                  address,
                  style:
                      AppTextStyles.regular13.copyWith(color: AppColors.gray),
                ),
              ],
            ),
          ),
          SvgPicture.asset(
            AppIcons.forwardArrow,
            color: AppColors.gray,
            height: 24.h,
            width: 24.h,
          ),
        ],
      ),
    );
  }
}
