import 'package:fit_flow/features/home/data/models/workout_plan_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final WorkoutPlanModel workoutPlan;

  HomeSuccess(this.workoutPlan);
}

class HomeFailure extends HomeState {
  final String message;

  HomeFailure(this.message);
}
