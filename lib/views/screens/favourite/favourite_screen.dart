import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../../../controllers/favourite_screen_controller.dart';
import '../../../controllers/get_controllers.dart';
import '../../../models/favourite_qus_model.dart';
import '../../../target_medical.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  static FavouriteScreenController controller =
      GetControllers.instance.getFavouriteScreenController();

  @override
  Widget build(BuildContext context) {
    controller.getFavQuestions();

    return Scaffold(
      appBar: AppAppBarStyles.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Obx(()=> SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 24.h),
                titleBarWidget(),
                for (int i = 0; i < controller.favQuestions.length; i++)
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: 20.h),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("${i+1}. ".enNumToBeNum),
                            Expanded(
                              child: Text(
                                controller.favQuestions[i].ques.data,
                                style: AppTextStyles.regular14,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: AlignedGridView.count(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            mainAxisSpacing: 10.h,
                            crossAxisSpacing: 10.w,
                            itemCount:  controller.favQuestions[i].option.length,
                            itemBuilder: (context, index) {
                              return optionContentWidget(controller.favQuestions[i].option[index], i);
                            },
                          ),
                        ),
                      ],
                    ),
                  )
              ],
            ),
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
          'Favourites',
          style: AppTextStyles.semiBold18.copyWith(color: AppColors.black),
        ),
      ],
    );
  }

  Widget optionContentWidget(Option option, int i) {
    return Text(
      '${(option.index).toString().enNumToEngLetter}. ${option.data}',
      style: AppTextStyles.regular14.copyWith(
        color:controller.favQuestions[i].ans == option.index.toString() ?AppColors.green2:AppColors.black,
      ),
    );
  }

  // Color getOptionColor(Option option) {
  //
  //     if (controller.favQuestions[i].ans! == option.index) {
  //       return AppColors.green;
  //     } else {
  //         return AppColors.transparent;
  //     }
  // }
}
