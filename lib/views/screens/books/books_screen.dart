import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:target_medical/controllers/resource_screen_controller.dart';
import 'package:target_medical/target_medical.dart';
import 'package:target_medical/controllers/books_screen_controller.dart';
import 'package:target_medical/controllers/get_controllers.dart';
import 'package:get/get.dart';
import 'package:target_medical/models/books_model.dart';
import 'package:target_medical/views/screens/pdf_view/pdf_view_screen.dart';
import 'package:target_medical/views/widgets/floating_widget.dart';
  
class BooksScreen extends StatelessWidget {
  BooksScreen({Key? key}) : super(key: key);
  
  final BooksScreenController controller =
      GetControllers.instance.getBooksScreenController();

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
                    'বই সমূহ',
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
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.h,
                  crossAxisSpacing: 10.w,
                  itemCount: resourceController.books.length,
                  itemBuilder: (context, index) {
                    return itemWidget(resourceController.books[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemWidget(Book book) {
    return InkWell(
      onTap: () {
        Get.to(() => PdfViewScreen(
          name: book.bookName.toString(),
          url: book.fileUrl.toString(),
        ));
      },
      child: FloatingWidget(
        alignment: Alignment.centerLeft,
        floatingChild: Container(
          margin: EdgeInsets.only(bottom: 16.h),
          child: SvgPicture.asset(
            AppIcons.book,
            width: 34.h,
            height: 34.h,
          ),
        ),
        floatingBody: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '',
                    textAlign: TextAlign.end,
                    style: AppTextStyles.semiBold11.copyWith(color: AppColors.blueAccent, fontSize: 1),
                  ),
                ),
                Text(
                  book.bookName.toString(),
                  style: AppTextStyles.semiBold14,
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                ),
                Text(
                  book.writerName.toString(),
                  style: AppTextStyles.semiBold11.copyWith(color: AppColors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

  