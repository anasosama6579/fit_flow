import 'dart:developer';

import 'package:fit_flow/core/helper/assets.dart';
import 'package:fit_flow/features/onboarding/ui/widgets/plan_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fit_flow/features/onboarding/data/repos/shared_prefs_onboarding_repo_imp.dart';

class PlanOptionsList extends StatefulWidget {
  const PlanOptionsList({super.key});

  @override
  State<PlanOptionsList> createState() => _PlanOptionsListState();
}

class _PlanOptionsListState extends State<PlanOptionsList> {
  late String _selectedPlan;
  final SharedPrefsOnboardingRepoImp _onboardingRepo =
      SharedPrefsOnboardingRepoImp();

  @override
  void initState() {
    super.initState();
    _selectedPlan = _onboardingRepo.getPlanGoal() ?? "get_strong";
  }

  @override
  Widget build(BuildContext context) {
    log(_selectedPlan);
    return Column(
      children: [
        PlanOption(
          title: "Gain Muscle",
          subtitle: "Focus on hypertrophy and strength",
          icon: Assets.dumbleSvg,
          isSelected: _selectedPlan == "build_muscle",
          onTap: () {
            setState(() => _selectedPlan = "build_muscle");
            _onboardingRepo.savePlanGoal("build_muscle");
          },
        ),
        SizedBox(height: 12.h),
        PlanOption(
          title: "Get Strong",
          subtitle: "Prioritize heavy lifting and power.",
          icon: Assets.weightSvg,
          isSelected: _selectedPlan == "get_strong",
          onTap: () {
            setState(() => _selectedPlan = "get_strong");
            _onboardingRepo.savePlanGoal("get_strong");
          },
        ),
        SizedBox(height: 12.h),
        PlanOption(
          title: "General Fitness",
          subtitle: "Balanced health and mobility",
          icon: Assets.streangthSvg,
          isSelected: _selectedPlan == "general_fitness",
          onTap: () {
            setState(() => _selectedPlan = "general_fitness");
            _onboardingRepo.savePlanGoal("general_fitness");
          },
        ),
      ],
    );
  }
}
