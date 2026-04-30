import 'package:fit_flow/core/theming/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExerciceCard extends StatelessWidget {
  const ExerciceCard({
    super.key,
    required this.title,

    required this.setsAndReps,
  });
  final String title;

  final String setsAndReps;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppStyles.font16RegularBlack),
          Text("$setsAndReps REPS", style: AppStyles.font13SemiBoldMainBlue),
        ],
      ),
    );
  }
}
