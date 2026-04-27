import 'package:fit_flow/core/helper/assets.dart';
import 'package:fit_flow/core/theming/app_colors.dart';
import 'package:fit_flow/core/theming/app_styles.dart';
import 'package:fit_flow/core/widgets/custom_button.dart';
import 'package:fit_flow/features/onboarding/ui/widgets/custom_appbar.dart';
import 'package:fit_flow/features/onboarding/ui/widgets/day_option.dart';
import 'package:fit_flow/features/onboarding/ui/widgets/plan_options_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppbar(),
              SizedBox(height: 70.h),
              Text("Select Your Goal", style: AppStyles.font34ExtraBoldBlack),
              SizedBox(height: 8.h),
              Text(
                "Customize your journey for precision performance.",
                style: AppStyles.font15RegularGrey,
              ),
              SizedBox(height: 32.h),
              PlanOptionsList(),
              SizedBox(height: 40.h),
              Text("Weakly Available", style: AppStyles.font18BoldBlack),
              WeeklyAvailability(),
              Spacer(),
              CustomButton(
                ontap: () {}, // Navigate to Home Screen
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Continue", style: AppStyles.font17SemiBoldWhite),
                    SizedBox(width: 8.w),
                    SvgPicture.asset(Assets.arrowRightSvg),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Center(
                child: Text(
                  "YOU CAN CHANGE THIS LATER IN PROFILE",
                  style: AppStyles.font10SemiBoldLightGrey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
