import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// This class extends [ChangeNotifier] from flutter that the flutter widgets
/// can rebuild when the [notifyListeners] method is called.
class SettingsState extends ChangeNotifier {
  SettingsState() {
    // This is a constructor meaning the first time this class is created this function will run
    init();
  }

  /// Using the [?] token we can create an optional value
  SharedPreferences? _prefs;

  // This is a private static method that is only inside the current class
  static const String _nameKey = 'setting_name';
  static const String _sourceColorKey = 'setting_source_color';
  static const String _themeModeKey = 'setting_theme_mode';

// THis function is called once when the class is created
  Future<void> init() async {
    /// Using the [shared+preferences] package we can get an instance to a
    /// plugin that will store and retrieve values from the device
    _prefs = await SharedPreferences.getInstance();

    /// Since the [name] is a [String] we can get it directly and provide a
    /// fallback value if it is [null]
    _name = _prefs!.getString(_nameKey) ?? 'Guest';

    /// We are storing color as an [int] since [Color] is a non primitive type
    _sourceColor = Color(_prefs!.getInt(_sourceColorKey) ?? Colors.red.value);

    /// We are storing the [ThemeMode] has an [int]
    /// because it is an [enum] in dart
    _themeMode = ThemeMode
        .values[_prefs!.getInt(_themeModeKey) ?? ThemeMode.system.index];

    /// Notify listeners will let any widgets listening know if they need to
    ///  rebuild because the state stages
    notifyListeners();
  }

// This is a private field that store state in the class
  String _name = 'Guest';

  /// This is a [getter] in dart to retrieve a value by the given [name] property
  String get name => _name;

  /// This is a [setter] in dart to update a value with the [name] property
  /// is called with a new value
  set name(String name) {
    _name = name;
    notifyListeners();

    // After the value is set we can save it back to the local device
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
