import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  Future<void> save({
    required String key,
    required String data,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, data);
  }

  Future<String> read({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }
}

class SharedPrefsKeys {
  static const favoriteUsers = 'FAVORITES_MOVIES';
}
