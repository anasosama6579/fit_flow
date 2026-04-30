import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  // Private constructor
  SharedPrefsHelper._();

  static late SharedPreferences _prefs;

  /// Call this inside your main() function before runApp()
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Save data based on its type
  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await _prefs.setString(key, value);
    if (value is int) return await _prefs.setInt(key, value);
    if (value is bool) return await _prefs.setBool(key, value);
    if (value is double) return await _prefs.setDouble(key, value);

    throw ArgumentError('Unsupported value type');
  }

  /// Get data
  static dynamic getData({required String key}) {
    return _prefs.get(key);
  }

  /// Remove specific data
  static Future<bool> removeData({required String key}) async {
    return await _prefs.remove(key);
  }

  /// Clear all stored data
  static Future<bool> clearAllData() async {
    return await _prefs.clear();
  }
}
