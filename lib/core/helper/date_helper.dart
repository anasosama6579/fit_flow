import 'dart:convert';
import 'package:fit_flow/core/storage/shared_pref_helper.dart';
import 'package:fit_flow/core/storage/storage_keys.dart';

class DateHelper {
  static List<Map<String, dynamic>> getCurrentWeekDays() {
    final String? jsonString = SharedPrefsHelper.getData(
      key: StorageKeys.weekDataKey,
    );
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
    await SharedPrefsHelper.saveData(
      key: StorageKeys.weekDataKey,
      value: jsonString,
    );
  }

  static int getWorkoutDayIndex() {
    return SharedPrefsHelper.getData(key: StorageKeys.workoutDayIndexKey) ?? 0;
  }

  static Future<void> saveWorkoutDayIndex(int index) async {
    await SharedPrefsHelper.saveData(
      key: StorageKeys.workoutDayIndexKey,
      value: index,
    );
  }

  static const List<String> _weekDayNames = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
}
