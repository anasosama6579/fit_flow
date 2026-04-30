import 'package:fit_flow/core/theming/app_colors.dart';
import 'package:fit_flow/core/theming/app_styles.dart';
import 'package:fit_flow/core/widgets/icon_container.dart';
import 'package:fit_flow/features/onboarding/ui/widgets/radio_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlanOption extends StatelessWidget {
  const PlanOption({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });
  final String title;
  final String subtitle;
  final String icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.white,
          border: Border.all(
            color: isSelected ? AppColors.mainBlue : AppColors.white,
            width: 2.w,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconContainer(icon: icon),
            SizedBox(width: 16.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppStyles.font16BoldBlack),
                Text(subtitle, style: AppStyles.font13RegularDarkGrey),
              ],
            ),
            Spacer(),
            RadioButton(isSelected: isSelected),
          ],
        ),
      ),
    );
  }
}
