import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:target_medical/controllers/resource_screen_controller.dart';
import 'package:target_medical/target_medical.dart';
import 'package:target_medical/controllers/notes_screen_controller.dart';
import 'package:target_medical/controllers/get_controllers.dart';
import 'package:get/get.dart';
import 'package:target_medical/models/notes_model.dart';
import 'package:target_medical/views/screens/pdf_view/pdf_view_screen.dart';

import '../../widgets/floating_widget.dart';

class NotesScreen extends StatelessWidget {
  NotesScreen({Key? key}) : super(key: key);

  final NotesScreenController controller =
      GetControllers.instance.getNotesScreenController();

  final ResourceScreenController resourceController =
      GetControllers.instance.getResourceScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarStyles.white,
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: AppColors.white,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Text(
                    'নোট সমূহ',
                    style: AppTextStyles.semiBold20.copyWith(
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(width: 24.w),
                  Opacity(
                    opacity: 0.0,
                    child: SvgPicture.asset(
                      AppIcons.backArrow,
                      color: AppColors.black,
                      width: 24.h,
                      height: 24.h,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                ),
                decoration: BoxDecoration(
                    color: AppColors.lightBlueAccent,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(4.r))),
                child: AlignedGridView.count(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  shrinkWrap: true,
                  crossAxisCount: 1,
                  mainAxisSpacing: 10.h,
                  crossAxisSpacing: 10.w,
                  itemCount: resourceController.notes.length,
                  itemBuilder: (context, index) {
                    return itemWidget(resourceController.notes[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
              RotatedBox(
                quarterTurns: 50,
                child: SvgPicture.asset(
                  AppIcons.backArrow,
                  width: 24.h,
                  height: 24.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
