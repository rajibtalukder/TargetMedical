import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:target_medical/controllers/favourite_screen_controller.dart';
import 'package:target_medical/target_medical.dart';
import 'package:target_medical/models/question_model.dart';

import '../../../../controllers/get_controllers.dart';

class QuestionItemWidget extends StatelessWidget {
  final QuestionModel question;
  final int index;
  final bool onlyQuestion;

  const QuestionItemWidget({
    Key? key,
    this.index = 0,
    required this.question,
    required this.onlyQuestion,
  }) : super(key: key);

  static final FavouriteScreenController controller =
      GetControllers.instance.getFavouriteScreenController();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 46.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${(index + 1).toString().enNumToBeNum}।  প্রশ্নঃ '),
              questionContentWidget(question.ques),
              SizedBox(width: 16.w),
              getStatueWidget(),
              SizedBox(width: 10.w),
              InkWell(
                onTap: () {
                  controller.addFavourite(
                      question.ques!.mcqId.toString());
                },
                child: SvgPicture.asset(
                  AppIcons.star,
                  height: 19.h,
                  width: 19.h,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: AlignedGridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 10.h,
              crossAxisSpacing: 10.w,
              itemCount: question.option!.length,
              itemBuilder: (context, index) {
                return optionContentWidget(question.option![index]);
              },
            ),
          ),
          SizedBox(height: 24.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ব্যাখ্যাঃ  ',
                  style: AppTextStyles.regular14.copyWith(
                      color: AppColors.gray, fontStyle: FontStyle.italic)),
              explanationContentWidget(),
            ],
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }

  Widget questionContentWidget(Ques? ques) {
    if (ques!.type == Type.IMAGE) {
      return Expanded(
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.h),
            child: CachedNetworkImage(
              imageUrl: ques.data!,
              width: 130.w,
              height: 130.h,
              fit: BoxFit.cover,
              placeholder: (context, url) {
                return Container(
                  width: 130.w,
                  height: 130.h,
                  decoration: BoxDecoration(
                      color: AppColors.lightGray,
                      borderRadius: BorderRadius.circular(8.r)),
                );
              },
              errorWidget: (context, url, error) {
                return Container(
                  width: 130.w,
                  height: 130.h,
                  decoration: BoxDecoration(
                      color: AppColors.lightGray,
                      borderRadius: BorderRadius.circular(8.r)),
                );
              },
            ),
          ),
        ),
      );
    }
    return Expanded(
      child: Text(
        ques.data!,
        style: AppTextStyles.regular14,
      ),
    );
  }

  Widget optionContentWidget(Option option) {
    if (option.type == Type.IMAGE) {
      return Expanded(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: getOptionColor(option, true),
              width: 2.w,
            ),
          ),
          clipBehavior: Clip.hardEdge,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: CachedNetworkImage(
              imageUrl: option.data!,
              width: 130.w,
              height: 130.h,
              fit: BoxFit.cover,
              placeholder: (context, url) {
                return Container(
                  width: 130.w,
                  height: 130.h,
                  decoration: BoxDecoration(
                      color: AppColors.lightGray,
                      borderRadius: BorderRadius.circular(8.r)),
                );
              },
              errorWidget: (context, url, error) {
                return Container(
                  width: 130.w,
                  height: 130.h,
                  decoration: BoxDecoration(
                      color: AppColors.lightGray,
                      borderRadius: BorderRadius.circular(8.r)),
                );
              },
            ),
          ),
        ),
      );
    }
    return Text(
      '${(option.index).toString().enNumToEngLetter}. ${option.data}',
      style: AppTextStyles.regular14.copyWith(
        color: getOptionColor(option, false),
      ),
    );
  }

  Widget explanationContentWidget() {
    if (question.explanation!.type == Type.IMAGE) {
      return Expanded(
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.h),
            child: CachedNetworkImage(
              imageUrl:
                  'https://lexam.adminpanel.soykothosen.com/ques_image/1681657752447q.jpeg',
              width: 130.w,
              height: 130.h,
              fit: BoxFit.cover,
              placeholder: (context, url) {
                return Container(
                  width: 130.w,
                  height: 130.h,
                  decoration: BoxDecoration(
                      color: AppColors.lightGray,
                      borderRadius: BorderRadius.circular(8.r)),
                );
              },
              errorWidget: (context, url, error) {
                return Container(
                  width: 130.w,
                  height: 130.h,
                  decoration: BoxDecoration(
                      color: AppColors.lightGray,
                      borderRadius: BorderRadius.circular(8.r)),
                );
              },
            ),
          ),
        ),
      );
    }
    return Expanded(
      child: Text(question.explanation!.data.toString(),
          style: AppTextStyles.regular14
              .copyWith(color: AppColors.gray, fontStyle: FontStyle.italic)),
    );
  }

  Color getOptionColor(Option option, bool isImage) {
    if (isImage) {
      if (question.ans! == option.index) {
        return AppColors.green;
      } else {
        if (question.selectedAnsIndex == option.index) {
          return AppColors.red;
        } else {
          return AppColors.transparent;
        }
      }
    } else {
      if (question.ans! == option.index) {
        return AppColors.green;
      } else {
        if (question.selectedAnsIndex == option.index) {
          return AppColors.red;
        } else {
          return AppColors.black;
        }
      }
    }
  }

  Widget getStatueWidget() {
    if (question.selectedAnsIndex != null) {
      if (question.selectedAnsIndex == question.ans) {
        return Text(
          'সঠিক',
          style: AppTextStyles.regular14.copyWith(color: AppColors.green),
        );
      } else {
        return Text(
          'ভুল',
          style: AppTextStyles.regular14.copyWith(color: AppColors.red),
        );
      }
    } else {
      if (onlyQuestion) {
        return Container();
      } else {
        return Text(
          'অনুুত্তরিত',
          style: AppTextStyles.regular14.copyWith(color: AppColors.gray),
        );
      }
    }
  }
}
