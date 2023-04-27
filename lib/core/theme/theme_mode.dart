import 'package:flutter/material.dart';

ValueNotifier<ThemeMode> themeMode = ValueNotifier(ThemeMode.light);

themeModeSetter() {
  if (themeMode.value == ThemeMode.system) {
    themeMode.value = ThemeMode.light;
  } else if (themeMode.value == ThemeMode.dark) {
    themeMode.value = ThemeMode.system;
  } else {
    themeMode.value = ThemeMode.dark;
  }
}
