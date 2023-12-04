import 'package:target_medical/target_medical.dart';
import 'package:target_medical/controllers/pdf_view_screen_controller.dart';
import 'package:target_medical/controllers/get_controllers.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewScreen extends StatelessWidget {
  final String url;
  final String name;

  PdfViewScreen({
    Key? key,
    required this.name,
    required this.url,
  }) : super(key: key);

  final PdfViewScreenController controller =
      GetControllers.instance.getPdfViewScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
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
                    child: Text(
                      name,
                      style: AppTextStyles.semiBold20.copyWith(
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SfPdfViewer.network(
                url,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
