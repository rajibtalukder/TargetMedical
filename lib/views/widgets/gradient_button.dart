import 'package:target_medical/target_medical.dart';

class GradientButton extends StatelessWidget {
  final String name;
  final Function onPressed;

  const GradientButton({Key? key, required this.name, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 14.w),
        padding: EdgeInsets.symmetric(vertical: 21.h, horizontal: 21.w),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            AppColors.custom('#96C3E7'),
            AppColors.custom('#FF82A8'),
          ]),
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: AppTextStyles.semiBold16.copyWith(
                color: AppColors.white,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
              decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.26),
                borderRadius: BorderRadius.circular(2.r),
              ),
              child: RotatedBox(
                quarterTurns: 2,
                child: SvgPicture.asset(
                  AppIcons.backArrow,
                  color: Colors.white,
                  width: 24.h,
                  height: 24.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
