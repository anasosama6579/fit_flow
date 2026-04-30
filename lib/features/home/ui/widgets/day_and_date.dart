import 'package:fit_flow/core/theming/app_colors.dart';
import 'package:fit_flow/core/theming/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DayAndDate extends StatelessWidget {
  final String shortName;
  final int day;
  final bool isProgressed;
  const DayAndDate({
    super.key,
    required this.shortName,
    required this.day,
    required this.isProgressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(shortName, style: AppStyles.font12RegularLightGrey),
        SizedBox(height: 10.h),
        CircleAvatar(
          radius: 20.r,
          backgroundColor: isProgressed
              ? AppColors.mainBlue
              : Color(0xFFEEEEEE),
          child: Text(
            day.toString(),
            style: isProgressed
                ? AppStyles.font12RegularLightGrey.copyWith(
                    color: AppColors.white,
                  )
                : AppStyles.font12RegularGrey,
          ),
        ),
      ],
    );
  }
}
