import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static late SharedPreferences sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static setString(String key, String value) async {
    await sharedPreferences.setString(key, value);
  }

  static String? getString(String key) => sharedPreferences.getString(key);
}
