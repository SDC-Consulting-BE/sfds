import "dart:async";

import "package:sfds/config.dart";
import "package:sfds/src/util/log_util.dart";
import "package:shared_preferences/shared_preferences.dart";

class SteveLocalStorageService implements SteveAppConfigItem {
  static const Set<String> _RESERVED_KEYS = {};

  static late final SharedPreferences _localStorage;

  @override
  Future<void> configure() async {
    _localStorage = await SharedPreferences.getInstance();
  }

  static bool containsKey(String key) => _localStorage.containsKey(key);

  static bool doesNotContainKey(String key) => !containsKey(key);

  static bool isReservedKey(String key) {
    var isReservedKey = _RESERVED_KEYS.contains(key);
    if (isReservedKey) {
      SteveLogUtil.warning("$key is a reserved local storage key!");
    }
    return isReservedKey;
  }

  static Future<bool> remove(String key) => _localStorage.remove(key);

  // bool

  static bool? readBool(String key) => _localStorage.getBool(key);

  static Future<bool> writeBool(String key, bool value) async => !isReservedKey(key) && await _localStorage.setBool(key, value);

  static Future<bool> writeBoolIfAbsent(String key, bool value) async => doesNotContainKey(key) && await writeBool(key, value);

  // int

  static int? readInt(String key) => _localStorage.getInt(key);

  static Future<bool> writeInt(String key, int value) async => !isReservedKey(key) && await _localStorage.setInt(key, value);

  static Future<bool> writeIntIfAbsent(String key, int value) async => doesNotContainKey(key) && await writeInt(key, value);

  // double

  static double? readDouble(String key) => _localStorage.getDouble(key);

  static Future<bool> writeDouble(String key, double value) async => !isReservedKey(key) && await _localStorage.setDouble(key, value);

  static Future<bool> writeDoubleIfAbsent(String key, double value) async => doesNotContainKey(key) && await writeDouble(key, value);

  // string

  static String? readString(String key) => _localStorage.getString(key);

  static Future<bool> writeString(String key, String value) async => !isReservedKey(key) && await _localStorage.setString(key, value);

  static Future<bool> writeStringIfAbsent(String key, String value) async => doesNotContainKey(key) && await writeString(key, value);

  // string list

  static List<String>? readStringList(String key) => _localStorage.getStringList(key);

  static Future<bool> writeStringList(String key, List<String> value) async => !isReservedKey(key) && await _localStorage.setStringList(key, value);

  static Future<bool> writeStringListIfAbsent(String key, List<String> value) async => doesNotContainKey(key) && await writeStringList(key, value);
}
