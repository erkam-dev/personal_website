import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme() {
  return ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
      ),
      colorSchemeSeed: const Color(0xFF6943C9),
      listTileTheme: ListTileThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
      cardTheme: CardTheme(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        elevation: 0,
      ),
      textTheme: GoogleFonts.montserratTextTheme().copyWith(
          displayLarge:
              GoogleFonts.montserrat(fontSize: 62, fontWeight: FontWeight.bold),
          displayMedium:
              GoogleFonts.montserrat(fontSize: 48, fontWeight: FontWeight.bold),
          displaySmall:
              GoogleFonts.montserrat(fontSize: 40, fontWeight: FontWeight.bold),
          headlineLarge:
              GoogleFonts.montserrat(fontSize: 62, fontWeight: FontWeight.bold),
          headlineMedium:
              GoogleFonts.montserrat(fontSize: 48, fontWeight: FontWeight.bold),
          headlineSmall:
              GoogleFonts.montserrat(fontSize: 40, fontWeight: FontWeight.bold),
          titleLarge:
              GoogleFonts.montserrat(fontSize: 32, fontWeight: FontWeight.bold),
          titleMedium:
              GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.bold),
          titleSmall:
              GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.bold),
          bodyLarge: GoogleFonts.montserrat(fontSize: 20),
          bodyMedium: GoogleFonts.montserrat(fontSize: 16),
          bodySmall: GoogleFonts.montserrat(fontSize: 12)),
      splashColor: Colors.deepPurple.withOpacity(0.3),
      tabBarTheme: TabBarTheme(
        dividerHeight: 0,
        tabAlignment: TabAlignment.center,
        indicator: BoxDecoration(
            color: const Color(0xFFE8DDFF),
            borderRadius: BorderRadius.circular(32),
            border: Border.all(width: 1, color: Colors.white24)),
        indicatorSize: TabBarIndicatorSize.tab,
      ));
}
