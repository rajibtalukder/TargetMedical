import 'package:target_medical/target_medical.dart';


class HorizontalListWidget extends StatelessWidget {
  final String title;
  final String optionName;
  final Function onPressedOption;
  const HorizontalListWidget(
      {Key? key, required this.title, required this.optionName, required this.onPressedOption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: AppTextStyles.semiBold16,
              ),
              InkWell(
                onTap: (){
                  onPressedOption();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      optionName,
                      style: AppTextStyles.semiBold11.copyWith(
                        color: AppColors.black,
                      ),
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
        ),
        SizedBox(height:10.h),
        SizedBox(
          height: 90.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              double leftPadding = 8.w;
              double rightPadding = 0;
              if (index == 0) {
                leftPadding = 10.w;
              }
              if (index == 9) {
                rightPadding = 10.w;
              }

              return Container(
                margin: EdgeInsets.only(left: leftPadding, right: rightPadding),
                height: 90.h,
                width: 78.w,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(color: AppColors.blueAccent),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
