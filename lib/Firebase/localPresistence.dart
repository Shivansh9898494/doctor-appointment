import 'package:shared_preferences/shared_preferences.dart';

class LocalPersistence {
  // Save String
  static Future<void> save(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  // Get String
  static Future<String?> get(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  // Remove
  static Future<void> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

}