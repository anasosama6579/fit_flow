import 'dart:math';

class DateHelper {
  static List<Map<String, dynamic>> getCurrentWeekDays() {
    DateTime now = DateTime.now();

    int weekday = now.weekday;
    DateTime startOfWeek = now.subtract(Duration(days: weekday - 1));

    return List.generate(7, (index) {
      DateTime date = startOfWeek.add(Duration(days: index));

      return {
        'day': date.day,

        'shortName': _weekDayNames[index],
        'isProgressed': Random()
            .nextBool(), // TODO: Replace with actual check is Progressed or not
      };
    });
  }

  static const List<String> _weekDayNames = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
}
