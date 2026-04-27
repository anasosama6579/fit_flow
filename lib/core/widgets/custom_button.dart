import 'package:fit_flow/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.child, required this.ontap});
  final Widget child;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 56.h),
        backgroundColor: AppColors.mainBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.r),
        ),
      ),
      onPressed: ontap,
      child: child,
    );
  }
}
