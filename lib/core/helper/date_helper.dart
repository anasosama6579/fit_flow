import 'dart:convert';
import 'package:fit_flow/core/storage/storage_keys.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DateHelper {
  static List<Map<String, dynamic>> getCurrentWeekDays() {
    final box = Hive.box(StorageKeys.userDataBox);
    final String? jsonString = box.get(StorageKeys.weekDataKey);
    if (jsonString != null) {
      final List<dynamic> decoded = jsonDecode(jsonString);
      final List<Map<String, dynamic>> storedWeek = decoded
          .map((e) => e as Map<String, dynamic>)
          .toList();

      DateTime now = DateTime.now();
      int weekday = now.weekday;
      DateTime startOfWeek = now.subtract(Duration(days: weekday - 1));

      if (storedWeek.isNotEmpty && storedWeek.first['day'] == startOfWeek.day) {
        return storedWeek;
      }
    }

    DateTime now = DateTime.now();
    int weekday = now.weekday;
    DateTime startOfWeek = now.subtract(Duration(days: weekday - 1));

    List<Map<String, dynamic>> newWeek = List.generate(7, (index) {
      DateTime date = startOfWeek.add(Duration(days: index));
      return {
        'day': date.day,
        'shortName': _weekDayNames[index],
        'isProgressed': false,
      };
    });

    saveWeekDays(newWeek);
    return newWeek;
  }

  static Future<void> saveWeekDays(List<Map<String, dynamic>> weekDays) async {
    final jsonString = jsonEncode(weekDays);
    final box = Hive.box(StorageKeys.userDataBox);
    await box.put(StorageKeys.weekDataKey, jsonString);
  }

  static int getWorkoutDayIndex() {
    final box = Hive.box(StorageKeys.userDataBox);
    return box.get(StorageKeys.workoutDayIndexKey, defaultValue: 0);
  }

  static Future<void> saveWorkoutDayIndex(int index) async {
    final box = Hive.box(StorageKeys.userDataBox);
    await box.put(StorageKeys.workoutDayIndexKey, index);
  }

  static const List<String> _weekDayNames = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
}
