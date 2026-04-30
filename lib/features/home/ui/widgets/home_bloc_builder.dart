import 'package:fit_flow/core/theming/app_styles.dart';
import 'package:fit_flow/features/home/logic/home_cubit.dart';
import 'package:fit_flow/features/home/logic/home_state.dart';
import 'package:fit_flow/features/home/ui/widgets/exercice_card.dart';
import 'package:fit_flow/features/home/ui/widgets/start_workout_section.dart';
import 'package:fit_flow/features/home/ui/widgets/weekly_progress_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBlocBuilder extends StatelessWidget {
  const HomeBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Your Workout plan is being generated",
                  style: AppStyles.font18BoldBlack,
                ),
                SizedBox(height: 12.h),
                CircularProgressIndicator(),
              ],
            ),
          );
        }
        if (state is HomeSuccess) {
          var exercises = state.workoutPlan.days[2].exercises;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Weekly Progress", style: AppStyles.font18BoldBlack),
              SizedBox(height: 12.h),
              WeeklyProgressSection(),
              SizedBox(height: 24.h),
              StartWorkoutSection(title: state.workoutPlan.title),
              SizedBox(height: 12.h),
              ...exercises.map(
                (exercise) => Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: ExerciceCard(
                    title: exercise.name,
                    setsAndReps: exercise.sets,
                  ),
                ),
              ),
            ],
          );
        }
        return Column(
          children: [
            Text(
              "Your Workout plan is not updated yet",
              style: AppStyles.font18BoldBlack,
            ),
          ],
        );
      },
    );
  }
}
