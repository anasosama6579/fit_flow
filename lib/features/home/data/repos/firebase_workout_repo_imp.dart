import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_flow/core/storage/storage_keys.dart';
import 'package:fit_flow/features/home/data/models/workout_plan_model.dart';
import 'package:fit_flow/features/home/domain/repos/workout_repo.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FirebaseWorkoutRepoImp implements WorkoutRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<WorkoutPlanModel?> getWorkoutPlan(
    String goal,
    String frequency,
  ) async {
    try {
      final String mappedFrequency = _mapFrequency(frequency);
      final String cacheKey = "${goal}_$mappedFrequency";

      // 1. Check local Hive cache first
      var box = Hive.box<WorkoutPlanModel>(StorageKeys.workoutPlanBox);
      if (box.containsKey(cacheKey)) {
        return box.get(cacheKey);
      }

      // 2. Fetch from Firebase if not in cache
      final DocumentSnapshot doc = await _firestore
          .collection('workout_plans')
          .doc(goal)
          .get();

      if (doc.exists) {
        final data = doc.data() as Map<String, dynamic>;

        if (data.containsKey(mappedFrequency)) {
          final workoutPlan = WorkoutPlanModel.fromJson(
            data[mappedFrequency] as Map<String, dynamic>,
          );

          // 3. Save to Hive cache
          await box.put(cacheKey, workoutPlan);

          return workoutPlan;
        }
      }
      return null;
    } catch (e) {
      throw Exception('Failed to fetch workout plan: $e');
    }
  }

  String _mapFrequency(String frequency) {
    switch (frequency) {
      case '2 Days':
        return '2_days';
      case '3 Days':
        return '3_days';
      case '4 Days':
        return '4_days';
      case '5+ Days':
        return '5_plus_days';
      default:
        // Attempt generic mapping if it doesn't match predefined constants
        return frequency
            .toLowerCase()
            .replaceAll(' ', '_')
            .replaceAll('+', '_plus');
    }
  }

  @override
  Future<bool> isUpdated() {
    // get the last updated time from firebase
    final isUpdated = _firestore
        .collection('workout_plans')
        .doc('is_updated')
        .get();
    return isUpdated.then((value) => value.exists);
  }
}
