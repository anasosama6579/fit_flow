import 'package:fit_flow/core/helper/assets.dart';
import 'package:fit_flow/core/theming/app_colors.dart';
import 'package:fit_flow/core/theming/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 30.h,
        bottom: 12.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Good Morning", style: AppStyles.font20BoldMainBlue),
              Text(
                "Let's get to work!",
                style: AppStyles.font12RegularLightGrey,
              ),
            ],
          ),
          SvgPicture.asset(Assets.settingSvg),
        ],
      ),
    );
  }
}
