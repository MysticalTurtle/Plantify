import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:recog_plantify/domain/entities/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesPlantify {
  Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final user = prefs.getString('user');
    if (user != null) {
      return User.fromJson(jsonDecode(user));
    } else {
      return null;
    }
  }

  Future<void> setUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('user', jsonEncode(user.toJson()));
    return;
  }

  Future<bool> getOnboardingViewed() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboardingViewed') ?? false;
  }

  Future<void> setOnboardingViewed(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('onboardingViewed', value);
    return;
  }

  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    return;
  }
}

class SecureStoragePlantify {
  Future<String?> getToken() async {
    const storage = FlutterSecureStorage();
    final value = await storage.read(key: "token");
    return value;
  }

  Future<void> setToken(String value) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: "token", value: value);
    return;
  }

  Future<void> clear() async {
    const storage = FlutterSecureStorage();
    await storage.deleteAll();
    return;
  }
}