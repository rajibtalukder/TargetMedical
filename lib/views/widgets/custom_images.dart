import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:target_medical/constants/app_colors.dart';


class CustomImages {
  CustomImages._();

  // static Widget circular({
  //   required String source,
  //   required double size,
  // }) {
  //   if (source.isEmpty) {
  //     return Image.asset(
  //       AppImages.userProfilePlaceholder,
  //       width: size,
  //       height: size,
  //     );
  //   }
  //   return ClipRRect(
  //     borderRadius: BorderRadius.circular(100),
  //     child: CachedNetworkImage(
  //       imageUrl: source,
  //       placeholder: (context, url) {
  //         return Container(
  //           width: size,
  //           height: size,
  //           color: AppColors.dark06,
  //         );
  //       },
  //       errorWidget: (context, url, error) {
  //         return Container(
  //           width: size,
  //           height: size,
  //           color: AppColors.dark06,
  //         );
  //       },
  //       width: size,
  //       height: size,
  //       fit: BoxFit.cover,
  //     ),
  //   );
  // }

  static Widget normal({
    required String source,
    double? width,
    double? height,
    double? radius,
    EdgeInsetsGeometry? padding,
    BoxFit? fit
  }) {
    if (source.isEmpty) {
      return Padding(
        padding: padding?? EdgeInsets.zero,
        child: Container(
          width: width ?? double.maxFinite,
          height: height ?? 150.h,
          decoration: BoxDecoration(
              color: AppColors.gray,
              borderRadius: BorderRadius.circular(radius ?? 8.r)),
        ),
      );
    }
    return Padding(
      padding: padding?? EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 8.r),
        child: CachedNetworkImage(
          imageUrl: source,
          placeholder: (context, url) {
            return Container(
              width: width ?? double.maxFinite,
              height: height ?? 150.h,
              color: AppColors.gray,
            );
          },
          errorWidget: (context, url, error) {
            return Container(
              width: width ?? double.maxFinite,
              height: height ?? 150.h,
              color: AppColors.gray,
            );
          },
          width: width ?? double.maxFinite,
          height: height ?? 150.h,
          fit: fit??BoxFit.cover,
        ),
      ),
    );
  }
}
