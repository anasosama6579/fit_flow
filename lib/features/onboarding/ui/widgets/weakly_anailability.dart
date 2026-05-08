import 'package:fit_flow/core/theming/app_colors.dart';
import 'package:fit_flow/core/theming/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fit_flow/features/onboarding/data/repos/shared_prefs_onboarding_repo_imp.dart';

class WeeklyAvailability extends StatefulWidget {
  const WeeklyAvailability({super.key});

  @override
  State<WeeklyAvailability> createState() => _WeeklyAvailabilityState();
}

class _WeeklyAvailabilityState extends State<WeeklyAvailability> {
  late String _selected;
  final SharedPrefsOnboardingRepoImp _onboardingRepo =
      SharedPrefsOnboardingRepoImp();

  final List<String> _options = ['2 Days', '3 Days', '4 Days', '5+ Days'];

  @override
  void initState() {
    super.initState();
    _selected = _onboardingRepo.getPlanFrequency();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 54.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: AppColors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _options.map((option) {
              final isSelected = option == _selected;
              return GestureDetector(
                onTap: () {
                  setState(() => _selected = option);
                  _onboardingRepo.savePlanFrequency(option);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.mainBlue : Colors.transparent,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    option,
                    style: AppStyles.font13SemiBoldLightGrey.copyWith(
                      color: isSelected ? AppColors.white : AppColors.grey,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
