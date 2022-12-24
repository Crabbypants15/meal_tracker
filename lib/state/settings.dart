import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsState extends ChangeNotifier {
  SettingsState() {
    init();
  }

  SharedPreferences? _prefs;
  static const String _nameKey = 'setting_name';
  static const String _sourceColorKey = 'setting_source_color';
  static const String _themeModeKey = 'setting_theme_mode';

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    _name = _prefs!.getString(_nameKey) ?? 'Guest';
    _sourceColor = Color(_prefs!.getInt(_sourceColorKey) ?? Colors.red.value);
    _themeMode = ThemeMode
        .values[_prefs!.getInt(_themeModeKey) ?? ThemeMode.system.index];
    notifyListeners();
  }

  String _name = 'Guest';
  String get name => _name;
  set name(String name) {
    _name = name;
    notifyListeners();
    _prefs?.setString(_nameKey, name);
  }

  Color _sourceColor = Colors.red;
  Color get sourceColor => _sourceColor;
  set sourceColor(Color sourceColor) {
    _sourceColor = sourceColor;
    notifyListeners();
    _prefs?.setInt(_sourceColorKey, sourceColor.value);
  }

  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;
  set themeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
    _prefs?.setInt(_themeModeKey, themeMode.index);
  }
}
