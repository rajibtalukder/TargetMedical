import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:target_medical/target_medical.dart';
import 'package:marquee/marquee.dart';
import 'package:target_medical/views/screens/favourite/favourite_screen.dart';

import '../../controllers/get_controllers.dart';
import '../../controllers/home_screen_controller.dart';

class CommonHeaderWidget extends StatelessWidget {
  final bool showNews;

  const CommonHeaderWidget({Key? key, this.showNews = false}) : super(key: key);

  static final HomeScreenController controller =
      GetControllers.instance.getHomeScreenController();
  static final ValueNotifier<int> currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                AppLogos.logo,
                width: 79.w,
                height: 70.h,
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Get.to(const FavouriteScreen());
                },
                child: SvgPicture.asset(
                  AppIcons.star,
                  height: 19.h,
                  width: 19.h,
                ),
              ),
              SizedBox(width: 16.w),
              InkWell(
                onTap: () {
                  AppKeys.scaffoldKey.currentState?.openEndDrawer();
                },
                child: SvgPicture.asset(
                  AppIcons.manu,
                  height: 16.h,
                  width: 14.h,
                ),
              ),
            ],
          ),
          newsWidget(),
        ],
      ),
    );
  }

  Widget newsWidget() {
    if (showNews == false) {
      return Container();
    }
    return Container(
      margin: EdgeInsets.only(top: 18.h),
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: AppColors.white2,
        borderRadius: BorderRadius.circular(4.r),
      ),
      alignment: Alignment.center,
      child: Row(
        children: [
          RotatedBox(
            quarterTurns: -50,
            child: SvgPicture.asset(
              AppIcons.forwardArrow,
              color: AppColors.gray,
              height: 16.h,
              width: 16.h,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: GetBuilder<HomeScreenController>(
                id: 'breakingNewsUpdate',
                builder: (context) {
                  return CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 20.h,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      onPageChanged: (index, reason) {
                        currentIndex.value = index;
                      },
                    ),
                    carouselController: CarouselController(),
                    itemCount: controller.breakingNews.length,
                    itemBuilder: (context, index, realIndex) {
                      if (controller.breakingNews.isEmpty) {
                        return Container();
                      }

                      return Text(
                        controller.breakingNews[currentIndex.value].breakingNews,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.semiBold13
                            .copyWith(color: AppColors.black),
                      );
                    },
                  );


                  // return controller.breakingNews.isEmpty?Text(''): Text(
                  //   controller.breakingNews[0].breakingNews,
                  //  // 'তোমরা অগ্রে ধাবিত হও তোমাদের পালনকর্তার ক্ষমা ও সেই জান্নাতের দিকে, যা আকাশ ও পৃথিবীর মত প্রশস্ত',
                  //   textAlign: TextAlign.center,
                  //   style:
                  //       AppTextStyles.semiBold13.copyWith(color: AppColors.black),
                  // );
                }),
          ),
          SizedBox(width: 16.w),
          SvgPicture.asset(
            AppIcons.forwardArrow,
            color: AppColors.gray,
            height: 14.h,
            width: 6.h,
          ),
      // SizedBox(
      //   height: 20.h,
      //   child: CarouselSlider(
      //     // Pass the list of strings as the items
      //     items: controller.breakingNews
      //         .map((item) => Text(
      //       controller.breakingNews[0].breakingNews,
      //       textAlign: TextAlign.center,
      //       style: AppTextStyles.semiBold13
      //           .copyWith(color: AppColors.black),
      //     ))
      //         .toList(),
      //     // Set the auto-play option to true
      //     options: CarouselOptions(autoPlay: true),
      //   ),
      // )
        ],

      ),
    );
  }

}
