import 'package:flutter_project_arch/src/business_logics/utils/log_debugger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsServices {
  static late SharedPreferences _prefsInstance;
  static final SharedPrefsServices _instance = SharedPrefsServices._internal();

  // getting instance of singleton class
  static SharedPrefsServices get getInstance => _instance;

  // private constructor
  SharedPrefsServices._internal();

  // initialization of shared preference instance
  static Future<void> init() async {
    try {
      _prefsInstance = await SharedPreferences.getInstance();
    } catch (e) {
      LogDebugger.instance.w(e.toString());
    }
  }

  // storing the string value by key name
  static Future<bool> setStringData(String key, String value) async {
    return _prefsInstance.setString(key, value);
  }

  // storing the integer value by key name
  static Future<bool> setIntegerData(String key, int value) async {
    return _prefsInstance.setInt(key, value);
  }

  // storing the boolean value by key name
  static Future<bool> setBooleanData(String key, bool value) async {
    return _prefsInstance.setBool(key, value);
  }

  // getting the string value by key name
  static String? getStringData(String key) {
    return _prefsInstance.getString(key);
  }

  // getting the integer value by key name
  static int getIntData(String key) {
    return _prefsInstance.getInt(key) ?? 0;
  }

  // getting the boolean value by key name
  static bool? getBoolData(String key) {
    return _prefsInstance.getBool(key);
  }

  // clear all data from shared preference
  static Future<bool> clearAllData() {
    return _prefsInstance.clear();
  }

}