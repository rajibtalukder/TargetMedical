import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:target_medical/constants/constant.dart';

class AppTextStyles {
  AppTextStyles._();




  static TextStyle get sliderLabels => TextStyle(
        color: AppColors.blueAccent,
        fontSize: 11.sp,
        fontFamily: AppFonts.liAdorNoirritRegular,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get screenTitle => TextStyle(
        color: AppColors.black,
        fontSize: 20.sp,
        fontFamily: AppFonts.liAdorNoirritSemiBold,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get title => TextStyle(
        color: AppColors.blue,
        fontSize: 14.sp,
        fontFamily: AppFonts.liAdorNoirritSemiBold,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get body => TextStyle(
        color: AppColors.gray,
        fontSize: 11.sp,
        fontFamily: AppFonts.liAdorNoirritSemiBold,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get examOption => TextStyle(
        color: AppColors.black,
        fontSize: 12.sp,
        fontFamily: AppFonts.liAdorNoirritRegular,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get number => TextStyle(
        color: AppColors.blue,
        fontSize: 16.sp,
        fontFamily: AppFonts.liAdorNoirritRegular,
        fontWeight: FontWeight.w400,
      );



  static TextStyle get _bold => TextStyle(
        color: AppColors.black,
        fontFamily: AppFonts.liAdorNoirritBold,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get _semiBold => TextStyle(
        color: AppColors.black,
        fontFamily: AppFonts.liAdorNoirritSemiBold,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get _regular => TextStyle(
        color: AppColors.black,
        fontFamily: AppFonts.liAdorNoirritRegular,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get widgetTitle => TextStyle(
    color: AppColors.black,
    fontSize: 16.sp,
    fontFamily: AppFonts.liAdorNoirritSemiBold,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get buttonText => TextStyle(
    color: AppColors.white,
    fontSize: 16.sp,
    fontFamily: AppFonts.liAdorNoirritRegular,
    fontWeight: FontWeight.w400,
  );



  ///FontSize:- 16
  static TextStyle get bold16 => _bold.copyWith(fontSize: 16.sp);

  ///FontSize:- 15
  static TextStyle get bold15 => _bold.copyWith(fontSize: 15.sp);

  ///FontSize:- 14
  static TextStyle get bold14 => _bold.copyWith(fontSize: 14.sp);

  ///FontSize:- 12
  static TextStyle get bold12 => _bold.copyWith(fontSize: 12.sp);


  ///FontSize:- 32
  static TextStyle get semiBold32 => _semiBold.copyWith(fontSize: 32.sp);

  ///FontSize:- 24
  static TextStyle get semiBold24 => _semiBold.copyWith(fontSize: 24.sp);

  ///FontSize:- 20
  static TextStyle get semiBold20 => _semiBold.copyWith(fontSize: 20.sp);

  ///FontSize:- 18
  static TextStyle get semiBold18 => _semiBold.copyWith(fontSize: 18.sp);

  ///FontSize:- 16
  static TextStyle get semiBold16 => _semiBold.copyWith(fontSize: 16.sp);

  ///FontSize:- 15
  static TextStyle get semiBold15 => _semiBold.copyWith(fontSize: 15.sp);

  ///FontSize:- 14
  static TextStyle get semiBold14 => _semiBold.copyWith(fontSize: 14.sp);

  ///FontSize:- 13
  static TextStyle get semiBold13 => _semiBold.copyWith(fontSize: 13.sp);

  ///FontSize:- 12
  static TextStyle get semiBold12 => _semiBold.copyWith(fontSize: 12.sp);

  ///FontSize:- 11
  static TextStyle get semiBold11 => _semiBold.copyWith(fontSize: 11.sp);

  ///FontSize:- 10
  static TextStyle get semiBold10 => _semiBold.copyWith(fontSize: 10.sp);

  ///FontSize:- 5
  static TextStyle get semiBold5 => _semiBold.copyWith(fontSize: 5.sp);

  ///FontSize:- 20
  static TextStyle get regular20 => _regular.copyWith(fontSize: 20.sp);

  ///FontSize:- 16
  static TextStyle get regular16 => _regular.copyWith(fontSize: 16.sp);

  ///FontSize:- 15
  static TextStyle get regular15 => _regular.copyWith(fontSize: 15.sp);

  ///FontSize:- 14
  static TextStyle get regular14 => _regular.copyWith(fontSize: 14.sp);

  ///FontSize:- 13
  static TextStyle get regular13 => _regular.copyWith(fontSize: 13.sp);

  ///FontSize:- 12
  static TextStyle get regular12 => _regular.copyWith(fontSize: 12.sp);

  ///FontSize:- 11
  static TextStyle get regular11 => _regular.copyWith(fontSize: 11.sp);

  ///FontSize:- 10
  static TextStyle get regular10 => _regular.copyWith(fontSize: 10.sp);


}
