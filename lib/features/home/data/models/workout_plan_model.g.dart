// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_plan_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExerciseModelAdapter extends TypeAdapter<ExerciseModel> {
  @override
  final int typeId = 0;

  @override
  ExerciseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExerciseModel(
      name: fields[0] as String,
      sets: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ExerciseModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.sets);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExerciseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WorkoutDayModelAdapter extends TypeAdapter<WorkoutDayModel> {
  @override
  final int typeId = 1;

  @override
  WorkoutDayModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkoutDayModel(
      day: fields[0] as String,
      focus: fields[1] as String,
      exercises: (fields[2] as List).cast<ExerciseModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, WorkoutDayModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.day)
      ..writeByte(1)
      ..write(obj.focus)
      ..writeByte(2)
      ..write(obj.exercises);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkoutDayModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WorkoutStatsModelAdapter extends TypeAdapter<WorkoutStatsModel> {
  @override
  final int typeId = 2;

  @override
  WorkoutStatsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkoutStatsModel(
      trainingDays: fields[0] as int,
      exercisesPerDay: fields[1] as int,
      weeklySets: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, WorkoutStatsModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.trainingDays)
      ..writeByte(1)
      ..write(obj.exercisesPerDay)
      ..writeByte(2)
      ..write(obj.weeklySets);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkoutStatsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WorkoutPlanModelAdapter extends TypeAdapter<WorkoutPlanModel> {
  @override
  final int typeId = 3;

  @override
  WorkoutPlanModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkoutPlanModel(
      title: fields[0] as String,
      subtitle: fields[1] as String,
      stats: fields[2] as WorkoutStatsModel,
      days: (fields[3] as List).cast<WorkoutDayModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, WorkoutPlanModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.subtitle)
      ..writeByte(2)
      ..write(obj.stats)
      ..writeByte(3)
      ..write(obj.days);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkoutPlanModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
