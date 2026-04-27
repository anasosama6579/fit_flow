import 'package:fit_flow/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UnselectedRadioButton extends StatelessWidget {
  const UnselectedRadioButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24.w,
      height: 24.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.white,
        border: Border.all(color: AppColors.grey, width: 1.w),
      ),
    );
  }
}
