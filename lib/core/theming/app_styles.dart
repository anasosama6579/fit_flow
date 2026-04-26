
import 'package:fit_flow/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  AppStyles._();
  static TextStyle font30BoldWhite = TextStyle(
    fontFamily: "Lexend",
    color: AppColors.white,
    fontSize: 30.sp,
    fontWeight: FontWeight.bold
  ); 
  static TextStyle font14LightWhite = TextStyle(
    fontFamily: "Lexend",
    color: AppColors.white,
    fontSize: 14.sp,
    fontWeight: FontWeight.w100
  ); 
}
