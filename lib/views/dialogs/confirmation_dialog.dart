import 'package:get/get.dart';
import 'package:target_medical/target_medical.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String massage;
  final Function onPressed;
  final String? acceptButtonText;
  final String? rejectButtonText;

  const ConfirmationDialog(
      {Key? key,
      required this.title,
      required this.massage,
      required this.onPressed,
      this.acceptButtonText,
      this.rejectButtonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14.w),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.r),
        color: AppColors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: AppTextStyles.semiBold18.copyWith(
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            massage,
            textAlign: TextAlign.center,
            style: AppTextStyles.semiBold14.copyWith(
              color: AppColors.gray,
              fontWeight: FontWeight.w400,
              fontFamily: AppFonts.liAdorNoirritRegular,
            ),
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      vertical: 12.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColors.black.withOpacity(0.05),
                    ),
                    child: Text(
                      rejectButtonText ?? 'Close',
                      style: AppTextStyles.semiBold16.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: InkWell(
                  onTap: () {
                    onPressed();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      vertical: 12.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColors.black,
                    ),
                    child: Text(
                      acceptButtonText ?? 'Yes',
                      style: AppTextStyles.semiBold16.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
