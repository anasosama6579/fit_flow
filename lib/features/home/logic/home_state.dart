import 'package:fit_flow/features/home/data/models/workout_plan_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final WorkoutPlanModel workoutPlan;
  final int currentWorkoutDayIndex;
  final List<Map<String, dynamic>> weekDays;

  HomeSuccess(this.workoutPlan, this.currentWorkoutDayIndex, this.weekDays);
}

class HomeFailure extends HomeState {
  final String message;

  HomeFailure(this.message);
}
