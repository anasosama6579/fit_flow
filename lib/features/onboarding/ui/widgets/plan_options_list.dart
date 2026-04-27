import 'package:fit_flow/core/helper/assets.dart';
import 'package:fit_flow/features/onboarding/ui/widgets/plan_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlanOptionsList extends StatefulWidget {
  const PlanOptionsList({super.key});

  @override
  State<PlanOptionsList> createState() => _PlanOptionsListState();
}

class _PlanOptionsListState extends State<PlanOptionsList> {
  String _selectedPlan = "Get Strong";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PlanOption(
          title: "Gain Muscle",
          subtitle: "Focus on hypertrophy and strength",
          icon: Assets.dumbleSvg,
          isSelected: _selectedPlan == "Gain Muscle",
          onTap: () => setState(() => _selectedPlan = "Gain Muscle"),
        ),
        SizedBox(height: 12.h),
        PlanOption(
          title: "Get Strong",
          subtitle: "Prioritize heavy lifting and power.",
          icon: Assets.weightSvg,
          isSelected: _selectedPlan == "Get Strong",
          onTap: () => setState(() => _selectedPlan = "Get Strong"),
        ),
        SizedBox(height: 12.h),
        PlanOption(
          title: "General Fitness",
          subtitle: "Balanced health and mobility",
          icon: Assets.streangthSvg,
          isSelected: _selectedPlan == "General Fitness",
          onTap: () => setState(() => _selectedPlan = "General Fitness"),
        ),
      ],
    );
  }
}
