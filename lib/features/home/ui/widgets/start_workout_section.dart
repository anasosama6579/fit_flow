import 'package:fit_flow/core/helper/assets.dart';
import 'package:fit_flow/core/theming/app_colors.dart';
import 'package:fit_flow/core/theming/app_styles.dart';
import 'package:fit_flow/core/widgets/custom_button.dart';
import 'package:fit_flow/core/widgets/icon_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class StartWorkoutSection extends StatelessWidget {
  const StartWorkoutSection({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconContainer(icon: Assets.dumbleSvg),
              SizedBox(width: 12.w),
              Text("Quick Workout", style: AppStyles.font20BoldMainBlue),
            ],
          ),
          SizedBox(height: 12.h),
          Text(title, style: AppStyles.font18BoldBlack),
          SizedBox(height: 28.h),
          CustomButton(
            ontap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Start Workout", style: AppStyles.font16RegularWhite),
                SizedBox(width: 12.w),
                SvgPicture.asset(Assets.playIconSvg),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
