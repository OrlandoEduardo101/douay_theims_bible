import 'package:flutter/material.dart';

class ThemeProvider {
  final ValueNotifier<bool> _isDarkModeNotifier = ValueNotifier<bool>(true);

  ValueNotifier<bool> get isDarkModeNotifier => _isDarkModeNotifier;

  bool get isDarkMode => _isDarkModeNotifier.value;

  set isDarkMode(bool value) {
    _isDarkModeNotifier.value = value;
  }

  ThemeData get currentTheme =>
      _isDarkModeNotifier.value ? ThemeData.dark(useMaterial3: true) : ThemeData.light(useMaterial3: true);
}
