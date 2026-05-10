import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tax_payer/Features/Auth/data/models/user/user.dart';

class Prefs {
  static late SharedPreferences inistance;

  static Future<void> init() async {
    inistance = await SharedPreferences.getInstance();
  }

  static setBool(String key, bool value) {
    inistance.setBool(key, value);
  }

  static bool getBool(String key) {
    return inistance.getBool(key) ?? false;
  }

  static removeBool(String key) {
    return inistance.remove(key);
  }

  static setString(String key, String value) {
    inistance.setString(key, value);
  }

  static String? getString(String key) {
    return inistance.getString(key);
  }

  static Future<void> setUser(String key, User value) async {
    final String jsonUser = jsonEncode(value.toJson());
    await inistance.setString(key, jsonUser);
  }

  static User? getUser(String key) {
    final String? jsonString = inistance.getString(key);

    if (jsonString == null) return null;

    final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return User.fromJson(jsonMap);
  }

  static Future<void> removeUser(String key) async {
    await inistance.remove(key);
  }

  static removeString(String key) {
    return inistance.remove(key);
  }
}
