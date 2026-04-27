import 'package:fit_flow/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectedRadioButton extends StatelessWidget {
  const SelectedRadioButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24.w,
      height: 24.h,
      padding: EdgeInsets.all(7.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.mainBlue,
      ),
      child: CircleAvatar(radius: 5.r, backgroundColor: AppColors.white),
    );
  }
}
