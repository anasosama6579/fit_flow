import 'package:fit_flow/core/helper/date_helper.dart';
import 'package:fit_flow/core/theming/app_colors.dart';
import 'package:fit_flow/features/home/ui/widgets/day_and_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeeklyProgressSection extends StatefulWidget {
  const WeeklyProgressSection({super.key});

  @override
  State<WeeklyProgressSection> createState() => _WeeklyProgressSectionState();
}

class _WeeklyProgressSectionState extends State<WeeklyProgressSection> {
  List<Map<String, dynamic>> weekDays = DateHelper.getCurrentWeekDays();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ...weekDays.map(
            (e) => DayAndDate(
              shortName: e['shortName'],
              day: e['day'],
              isProgressed: e['isProgressed'],
            ),
          ),
        ],
      ),
    );
  }
}
