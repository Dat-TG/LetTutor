import 'package:flutter/material.dart';
import 'package:let_tutor/l10n/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {
  Locale? _locale;
  Locale? get locale => _locale;

  LocaleProvider() {
    getLocaleFromSettings();
  }

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;
    _locale = locale;
    changeLocaleSettings(locale);
  }

  void clearLocale() {
    _locale = null;
    notifyListeners();
  }

  void changeLocaleSettings(Locale newLocale) async {
    if (!L10n.all.contains(newLocale)) return;
    _locale = newLocale;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', _locale?.languageCode ?? 'en');
    notifyListeners();
  }

  Future getLocaleFromSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String locale = prefs.getString('locale') ?? 'en';
    Locale newLocale = Locale(locale);
    if (!L10n.all.contains(newLocale)) {
      newLocale = const Locale('en');
    }
    _locale = newLocale;
    notifyListeners();
  }
}
