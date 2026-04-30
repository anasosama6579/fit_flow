import 'package:hive/hive.dart';

part 'workout_plan_model.g.dart';

@HiveType(typeId: 0)
class ExerciseModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String sets;

  ExerciseModel({required this.name, required this.sets});

  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
      name: json['name'] as String? ?? '',
      sets: json['sets'] as String? ?? '',
    );
  }
}

@HiveType(typeId: 1)
class WorkoutDayModel {
  @HiveField(0)
  final String day;
  @HiveField(1)
  final String focus;
  @HiveField(2)
  final List<ExerciseModel> exercises;

  WorkoutDayModel({
    required this.day,
    required this.focus,
    required this.exercises,
  });

  factory WorkoutDayModel.fromJson(Map<String, dynamic> json) {
    return WorkoutDayModel(
      day: json['day'] as String? ?? '',
      focus: json['focus'] as String? ?? '',
      exercises: (json['exercises'] as List<dynamic>?)
              ?.map((e) => ExerciseModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}

@HiveType(typeId: 2)
class WorkoutStatsModel {
  @HiveField(0)
  final int trainingDays;
  @HiveField(1)
  final int exercisesPerDay;
  @HiveField(2)
  final int weeklySets;

  WorkoutStatsModel({
    required this.trainingDays,
    required this.exercisesPerDay,
    required this.weeklySets,
  });

  factory WorkoutStatsModel.fromJson(Map<String, dynamic> json) {
    return WorkoutStatsModel(
      trainingDays: json['training_days'] as int? ?? 0,
      exercisesPerDay: json['exercises_per_day'] as int? ?? 0,
      weeklySets: json['weekly_sets'] as int? ?? 0,
    );
  }
}

@HiveType(typeId: 3)
class WorkoutPlanModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String subtitle;
  @HiveField(2)
  final WorkoutStatsModel stats;
  @HiveField(3)
  final List<WorkoutDayModel> days;

  WorkoutPlanModel({
    required this.title,
    required this.subtitle,
    required this.stats,
    required this.days,
  });

  factory WorkoutPlanModel.fromJson(Map<String, dynamic> json) {
    return WorkoutPlanModel(
      title: json['title'] as String? ?? '',
      subtitle: json['subtitle'] as String? ?? '',
      stats: json['stats'] != null
          ? WorkoutStatsModel.fromJson(json['stats'] as Map<String, dynamic>)
          : WorkoutStatsModel(
              trainingDays: 0, exercisesPerDay: 0, weeklySets: 0),
      days: (json['days'] as List<dynamic>?)
              ?.map((e) => WorkoutDayModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}
