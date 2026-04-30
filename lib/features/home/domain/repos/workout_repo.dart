import 'package:fit_flow/features/home/data/models/workout_plan_model.dart';

abstract class WorkoutRepo {
  Future<WorkoutPlanModel?> getWorkoutPlan(String goal, String frequency);
  Future<bool> isUpdated();
}
