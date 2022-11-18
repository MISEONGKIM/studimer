import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesClass {
  static Future<void> saveDisk(List<String> value) async {
    removeDisk();
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('setting', value);
  }

  static Future<List<String>> readDisk() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('setting') ?? [];
  }

  static Future<void> removeDisk() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('setting');
  }
}
