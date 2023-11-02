import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkModeProvider extends ChangeNotifier {
  bool? _isDarkModeOn;
  bool? get isDarkModeOn => _isDarkModeOn;

  DarkModeProvider() {
    getThemeModeFromSettings();
  }

  void changDarkModeSettings(bool isDark) async {
    _isDarkModeOn = isDark;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('darkMode', isDark);
    notifyListeners();
  }

  Future getThemeModeFromSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isDark = prefs.getBool('darkMode');
    _isDarkModeOn = isDark;
    notifyListeners();
  }
}
