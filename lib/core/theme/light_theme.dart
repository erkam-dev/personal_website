import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
    fontFamily: "Product Sans",
    brightness: Brightness.light,
    useMaterial3: true,
    colorSchemeSeed: const Color(0xFF6943C9),
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    cardTheme: CardTheme(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}
