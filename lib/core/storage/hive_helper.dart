import 'package:fit_flow/core/storage/storage_keys.dart';
import 'package:fit_flow/features/home/data/models/workout_plan_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper {
  static Future<void> init() async {
    await Hive.initFlutter();
    
    // Register adapters
    Hive.registerAdapter(ExerciseModelAdapter());
    Hive.registerAdapter(WorkoutDayModelAdapter());
    Hive.registerAdapter(WorkoutStatsModelAdapter());
    Hive.registerAdapter(WorkoutPlanModelAdapter());
    
    // Open boxes
    await Hive.openBox<WorkoutPlanModel>(StorageKeys.workoutPlanBox);
  }
}
