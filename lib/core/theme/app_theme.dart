import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffadc6ff), // primary
      onPrimary: Color(0xff002e6a), // on-primary
      primaryContainer: Color(0xff4d8eff), // primary-container
      onPrimaryContainer: Color(0xff00285d), // on-primary-container
      secondary: Color(0xffd0bcff), // secondary
      onSecondary: Color(0xff3c0091), // on-secondary
      secondaryContainer: Color(0xff571bc1), // secondary-container
      onSecondaryContainer: Color(0xffc4abff), // on-secondary-container
      tertiary: Color(0xffffb786), // tertiary
      onTertiary: Color(0xff502400), // on-tertiary
      tertiaryContainer: Color(0xffdf7412), // tertiary-container
      onTertiaryContainer: Color(0xff461f00), // on-tertiary-container
      error: Color(0xffffb4ab), // error
      onError: Color(0xff690005), // on-error
      errorContainer: Color(0xff93000a), // error-container
      onErrorContainer: Color(0xffffdad6), // on-error-container
      surface: Color(0xff10131a), // surface
      onSurface: Color(0xffe1e2ec), // on-surface
      surfaceContainerHighest: Color(0xff32353c), // surface-container-highest
      onSurfaceVariant: Color(0xffc2c6d6), // on-surface-variant
      outline: Color(0xff8c909f), // outline
      outlineVariant: Color(0xff424754), // outline-variant
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e2ec), // inverse-surface
      onInverseSurface: Color(0xff2e3038), // inverse-on-surface
      inversePrimary: Color(0xff005ac2), // inverse-primary
      surfaceTint: Color(0xffadc6ff), // surface-tint
    ),
    scaffoldBackgroundColor: const Color(0xff10131a), // background / surface
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff10131a), // surface
      foregroundColor: Color(0xffe1e2ec), // on-surface
      elevation: 0,
      centerTitle: false,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xff1d2027), // surface-container
      selectedItemColor: Color(0xffadc6ff), // primary
      unselectedItemColor: Color(0xffc2c6d6), // on-surface-variant
      elevation: 0,
      type: BottomNavigationBarType.fixed,
    ),
    cardTheme: CardThemeData(
      color: const Color(0xff1d2027), // surface-container
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xff191b23), // surface-container-low
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xffadc6ff)), // primary
      ),
      labelStyle:
          const TextStyle(color: Color(0xffc2c6d6)), // on-surface-variant
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xffadc6ff), // primary
        foregroundColor: const Color(0xff002e6a), // on-primary
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xffadc6ff), // primary
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xffadc6ff), // primary
        side: const BorderSide(color: Color(0xff424754)), // outline-variant
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );
}
