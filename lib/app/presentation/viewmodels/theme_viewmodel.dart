import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UiProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  late SharedPreferences storage;

  void changeTheme(ThemeMode mode) {
    _themeMode = mode;
    storage.setString('themeMode', mode.name);
    notifyListeners();
  }

  Future<void> init() async {
    storage = await SharedPreferences.getInstance();
    final saved = storage.getString('themeMode');
    _themeMode = ThemeMode.values.firstWhere(
      (e) => e.name == saved,
      orElse: () => ThemeMode.system,
    );
    notifyListeners();
  }
}
