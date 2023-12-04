import 'package:intl/intl.dart';
import 'package:target_medical/target_medical.dart';
import 'package:target_medical/models/live_exam_model.dart';

import 'floating_widget.dart';

class ExamItemWidget extends StatelessWidget {
  final Color? color;
  final Color? borderColor;
  final EdgeInsetsGeometry? padding;
  final Function? onPressed;
  final LiveExam exam;

  const ExamItemWidget(
      {Key? key,
      this.color,
      this.borderColor,
      this.padding,
      this.onPressed,
      required this.exam})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 8.h),
      child: InkWell(
        onTap: () {
          if (onPressed != null) {
            onPressed!();
          }
        },
        child: Padding(
          padding: padding ?? EdgeInsets.symmetric(horizontal: 14.w),
          child: FloatingWidget(
            alignment: Alignment.topRight,
            floatingChild: Container(
              margin: EdgeInsets.only(right: 16.w),
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: color ?? AppColors.custom('#BB86FD'),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    AppIcons.clock,
                    width: 15.h,
                    height: 15.h,
                  ),
                  SizedBox(width: 6.w),
                  Text(
                      DateFormat('hh:mm a')
                          .format(DateTime.parse(exam.schedule.toString()))
                          .toLowerCase(),
                      style: AppTextStyles.semiBold16.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 15.sp,
                      )),
                ],
              ),
            ),
            floatingBody: Container(
              height: 86.h,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(4.r),
                border: borderColor != null
                    ? Border.all(
                        color: borderColor!,
                      )
                    : null,
              ),
              child: Row(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        exam.examName!,
                        style: AppTextStyles.semiBold14,
                      ),
                      const Spacer(),
                      Text(
                        'প্রশ্ন - ${exam.totalQuestion}',
                        style:AppTextStyles.semiBold11.copyWith(color: AppColors.gray),
                      ),
                      Text(
                        'সময় - ${exam.examDuration}',
                        style:AppTextStyles.semiBold11.copyWith(color: AppColors.gray),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Spacer(),
                      Text(
                        'পরীক্ষার্থী : ${exam.examineeNum}',
                        style:AppTextStyles.semiBold11.copyWith(color: AppColors.gray),
                      ),
                      const Spacer(),
                      Text(
                        DateFormat('dd MMMM, yyyy')
                            .format(DateTime.parse(exam.schedule.toString())),
                        style:AppTextStyles.semiBold11.copyWith(color: AppColors.gray),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
