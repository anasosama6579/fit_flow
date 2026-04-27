import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconContainer extends StatelessWidget {
  const IconContainer({super.key, required this.icon});
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48.w,
      height: 48.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Color(0xFFF8FAFC),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: SvgPicture.asset(icon),
    );
  }
}
