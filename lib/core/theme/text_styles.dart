import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:may_fair/core/theme/color.dart';
import 'package:may_fair/core/theme/font_weight.dart';

class TextStyles {
  // Black
  static final TextStyle font18BoldBlack = TextStyle(
    color: Colors.black,
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.semiBold,
  );
  static final TextStyle font14BoldBlack = TextStyle(
    color: Colors.black,
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.semiBold,
  );
  static final TextStyle font14LightBlack = TextStyle(
    color: Colors.black,
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.light,
  );
  static final TextStyle font18MediumBlack = TextStyle(
    color: Colors.black,
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.medium,
  );
  static final TextStyle font18RegularBlack = TextStyle(
    color: Colors.black,
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.regular,
  );
  // white
  static final TextStyle font18BoldWhite = TextStyle(
    color: Colors.white,
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.semiBold,
  );
  static final TextStyle font14MediumWhite = TextStyle(
    color: Colors.white,
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
  );
  // Grey
  static final TextStyle font16GreyLightMedium = TextStyle(
    color: Colors.grey,
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
  );
  static final TextStyle font14GreyMedium = TextStyle(
    color: Colors.grey,
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
  );
  static final TextStyle font12GreyMedium = TextStyle(
    color: Colors.grey,
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.medium,
  );
  static final TextStyle font13GreyDarkRegular = TextStyle(
    color: ColorsManager.greyDark,
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.regular,
  );
  static final TextStyle font16GreyRegular = TextStyle(
    color: ColorsManager.grey,
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
  );
  // Yellow
  static final TextStyle font14YellowMedium = TextStyle(
    color: ColorsManager.mainYellow,
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
  );
  static final TextStyle font24YellowBold = TextStyle(
    color: ColorsManager.mainYellow,
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
  );
  // Blue

  static final TextStyle font24BlueBold = TextStyle(
    color: ColorsManager.mainBlue,
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
  );
  static final TextStyle font20BlueBold = TextStyle(
    color: ColorsManager.mainBlue,
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.bold,
  );
}
