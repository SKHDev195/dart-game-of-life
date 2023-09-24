import 'package:flutter/material.dart';

sealed class AppTheme {
  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color.fromARGB(255, 31, 111, 55),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFF97F0FF),
    onPrimaryContainer: Color(0xFF001F24),
    secondary: Color(0xFF266C24),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFA9F59C),
    onSecondaryContainer: Color(0xFF002202),
    tertiary: Color(0xFF336B23),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFB4F39A),
    onTertiaryContainer: Color(0xFF032100),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFAFDFD),
    onBackground: Color(0xFF191C1D),
    surface: Color(0xFFFAFDFD),
    onSurface: Color(0xFF191C1D),
    surfaceVariant: Color(0xFFDBE4E6),
    onSurfaceVariant: Color(0xFF3F484A),
    outline: Color(0xFF6F797A),
    onInverseSurface: Color(0xFFEFF1F1),
    inverseSurface: Color(0xFF2E3132),
    inversePrimary: Color(0xFF4FD8EB),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF006874),
    outlineVariant: Color(0xFFBFC8CA),
    scrim: Color(0xFF000000),
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color.fromARGB(255, 76, 175, 80),
    onPrimary: Color(0xFF00363D),
    primaryContainer: Color(0xFF004F58),
    onPrimaryContainer: Color(0xFF97F0FF),
    secondary: Color(0xFF8ED882),
    onSecondary: Color(0xFF003A05),
    secondaryContainer: Color(0xFF04530D),
    onSecondaryContainer: Color(0xFFA9F59C),
    tertiary: Color(0xFF99D681),
    onTertiary: Color(0xFF093900),
    tertiaryContainer: Color(0xFF1B520B),
    onTertiaryContainer: Color(0xFFB4F39A),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF191C1D),
    onBackground: Color(0xFFE1E3E3),
    surface: Color(0xFF191C1D),
    onSurface: Color(0xFFE1E3E3),
    surfaceVariant: Color(0xFF3F484A),
    onSurfaceVariant: Color(0xFFBFC8CA),
    outline: Color(0xFF899294),
    onInverseSurface: Color(0xFF191C1D),
    inverseSurface: Color(0xFFE1E3E3),
    inversePrimary: Color(0xFF006874),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF4FD8EB),
    outlineVariant: Color(0xFF3F484A),
    scrim: Color(0xFF000000),
  );

  static final ThemeData lightTheme = ThemeData(
    colorScheme: lightColorScheme,
  );

  static final ThemeData darkTheme = ThemeData(
    colorScheme: darkColorScheme,
  );
}
