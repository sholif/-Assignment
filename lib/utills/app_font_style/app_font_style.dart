


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors/app_colors.dart';

TextStyle myStyleManropeCustom({
  double fontSize = 14,
  Color color = Colors.black,
  FontWeight? fontWeight,
  FontStyle? fontStyle,
  double? letterSpacing,
  TextDecoration? decoration,
  Color? decorationColor,
  double? height,
}) {

  return TextStyle(
    fontFamily: 'Manrope',
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    decoration: decoration,
    decorationColor: decorationColor,
    letterSpacing: letterSpacing,
    height: height,
  );
}


// for  Extra large

TextStyle extraLargeStyle() => TextStyle(
    fontFamily: 'Manrope',color: AppColors.whiteColor,fontSize: 28.sp,fontWeight: FontWeight.w700, letterSpacing: -0.32,

);


TextStyle largeStyle() => TextStyle(
    fontFamily: 'Manrope',color: AppColors.whiteColor,fontSize: 24.sp,fontWeight: FontWeight.w700, letterSpacing: -0.48, height: 1.32
);

TextStyle mediumLargeStyle() => TextStyle(
    fontFamily: 'Manrope',color: AppColors.whiteColor,fontSize: 16.sp,fontWeight: FontWeight.w600, letterSpacing: -0.14, height: 1.7
);

TextStyle mediumStyle([Color clr = AppColors.whiteColor]) => TextStyle(
    fontFamily: 'Manrope',color: clr,fontSize: 12.sp,fontWeight: FontWeight.w400, letterSpacing: -0.14, height: 1.7
);

TextStyle buttonStyle() => TextStyle(
    fontFamily: 'Manrope',color: AppColors.btnTextColor,fontSize: 14.sp,fontWeight: FontWeight.w600, letterSpacing: -0.14, height: 1.7
);


TextStyle inputTextColor() => TextStyle(
    fontFamily: 'Manrope',color: AppColors.whiteColor,fontSize: 14.sp,fontWeight: FontWeight.w400, letterSpacing: -0.14, height: 1.7
);




/// Monserat

TextStyle myStyleMontSerratCustom({
  double fontSize = 14,
  Color color = Colors.black,
  FontWeight? fontWeight,
  FontStyle? fontStyle,
  double? letterSpacing,
  TextDecoration? decoration,
  Color? decorationColor,
  double? height,
}) {

  return TextStyle(
    fontFamily: 'Montserrat',
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    decoration: decoration,
    decorationColor: decorationColor,
    letterSpacing: letterSpacing,
    height: height,
  );
}


TextStyle extraLargeMontSerratStyle() => TextStyle(
  fontFamily: 'Montserrat',
  color: AppColors.whiteColor,
   fontSize: 28.sp,
   fontWeight: FontWeight.w700,
   letterSpacing: 1,
   height: 1.31.h

);

TextStyle mediumLargeMonseratStyle([Color clr = AppColors.whiteColor]) => TextStyle(
    fontFamily: 'Montserrat',color: clr,fontSize: 16.sp,fontWeight: FontWeight.w500, letterSpacing: -0.14, height: 1.7
);

TextStyle montserrat16SemiBold([Color clr = AppColors.whiteColor]) => TextStyle(
  fontFamily: 'Montserrat',
  color: clr,
  fontSize: 16.sp,
  fontWeight: FontWeight.w600,
 //letterSpacing: -0.15,
  height: 1.32,
);

TextStyle montserrat14Regular([Color clr = AppColors.whiteColor]) => TextStyle(
  fontFamily: 'Montserrat',
  color: clr,
  fontSize: 14.sp,
  fontWeight: FontWeight.w400,
  //letterSpacing: -0.15,
  height: 1.64,
);




