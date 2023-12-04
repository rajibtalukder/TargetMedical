import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:target_medical/models/notes_model.dart';
import 'package:target_medical/views/screens/notes/notes_screen.dart';
import 'package:target_medical/views/screens/pdf_view/pdf_view_screen.dart';
import 'package:target_medical/views/widgets/floating_widget.dart';
import 'package:target_medical/target_medical.dart';

import '../../../../controllers/get_controllers.dart';
import '../../../../controllers/resource_screen_controller.dart';

class NoteWidget extends StatelessWidget {
  NoteWidget({
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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'রুটিন',
                  //'নোট',
                  style: AppTextStyles.semiBold16,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => NotesScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'আরো দেখুন',
                        style: AppTextStyles.semiBold11.copyWith(color: AppColors.blue2),
                      ),   
                      SvgPicture.asset(
                        AppIcons.forwardArrow,
                        width: 12.h,
                        height: 12.h,
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            AlignedGridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 1,
              mainAxisSpacing: 10.h,
              crossAxisSpacing: 10.w,
              itemCount:
                  controller.notes.length <= 4 ? controller.notes.length : 4,
              itemBuilder: (context, index) {
                return itemWidget(controller.notes[index]);
              },
            ),
          ],
        ),
      );
    });
  }

  Widget itemWidget(Note note) {
    return InkWell(
      onTap: () {
        Get.to(() => PdfViewScreen(
              name: note.noteName.toString(),
              url: note.noteFileUrl.toString(),
            ));
      },
      child: FloatingWidget(
        alignment: Alignment.centerLeft,
        floatingChild: SvgPicture.asset(
          AppIcons.file,
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
              Text(
                note.noteName.toString(),
                style: AppTextStyles.semiBold14,
                maxLines: 2,
                overflow: TextOverflow.clip,
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
      ),
    );
  }
}
