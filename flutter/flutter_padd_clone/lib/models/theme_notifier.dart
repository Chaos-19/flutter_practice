import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  Future<void> loadTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    _isDarkMode = prefs.getBool('isDarkMode') ?? false;

    notifyListeners();
  }

  Future<void> toggleTheme() async {
    _isDarkMode = !_isDarkMode;

    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool('isDarkMode', _isDarkMode);
    notifyListeners();
  }

  ThemeMode get currentThemeMode =>
      _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  ThemeData get currentTheme =>
      _isDarkMode ? ThemeData.dark() : ThemeData.light();
}
