import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:target_medical/models/notes_model.dart';
import 'package:target_medical/views/screens/notes/notes_screen.dart';
import 'package:target_medical/views/screens/pdf_view/pdf_view_screen.dart';
import 'package:target_medical/views/widgets/floating_widget.dart';
import 'package:target_medical/target_medical.dart';

import '../../../../controllers/get_controllers.dart';
import '../../../../controllers/resource_screen_controller.dart';

class CodeNumberWidget extends StatelessWidget {
  CodeNumberWidget({
    Key? key,
  }) : super(key: key);
  final ResourceScreenController controller =
  GetControllers.instance.getResourceScreenController();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.notes.isEmpty) {
        return Container();
      }

      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 14.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'কোড নাম্বার',
              style: AppTextStyles.semiBold16,
            ),
            SizedBox(height: 10.h),
            itemWidget(),
          ],
        ),
      );
    });
  }

  Widget itemWidget() {
    return FloatingWidget(
      alignment: Alignment.centerLeft,
      floatingChild: SvgPicture.asset(
        AppIcons.fileBlack,
        width: 38.h,
        height: 38.h,
      ),
      floatingBody: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Row(
          children: [
            SizedBox(width: 16.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'নাম',
                  style: AppTextStyles.semiBold14.copyWith(color: AppColors.black),
                ),
                Text(
                  '২৪/০২/২৩',
                  style: AppTextStyles.semiBold14.copyWith(color: AppColors.black),
                ),
              ],
            ),
            const Spacer(),
            SvgPicture.asset(
              AppIcons.download,
              height: 15.h,
              width: 15.h,
            ),
          ],
        ),
      ),
    );
  }
}
