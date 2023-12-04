import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:target_medical/constants/app_colors.dart';
import 'package:target_medical/target_medical.dart';

class PackagesWidget extends StatelessWidget {
  const PackagesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.h),
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 12.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(4.r),
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
          valueWidget(
            model: 'Package 2',
            name: 'Exam + Video (6 months) :',
            slides: 'এই প্ল্যানে আরো আছে দাগানো বই, pdf & slides',
            taka: '700',
          ),
        ],
      ),
    );
  }

  Widget valueWidget({
    required String model,
    required String name,
    required String slides,
    required String taka,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          model,
          style: AppTextStyles.semiBold16.copyWith(color: AppColors.black),
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style:
                        AppTextStyles.regular16.copyWith(color: AppColors.black),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    slides,
                    style: AppTextStyles.regular14
                        .copyWith(color: AppColors.green2),
                  ),
                ],
              ),
            ),
            Text(
              taka,
              style: AppTextStyles.semiBold20,
            )
          ],
        ),
        SizedBox(height: 12.h),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            color: AppColors.pink,
          ),
          child: Text(
            'Buy',
            style: AppTextStyles.semiBold16.copyWith(color: AppColors.white),
          ),
        ),
      ],
    );
  }
}
