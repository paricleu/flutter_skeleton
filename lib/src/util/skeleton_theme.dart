import 'package:flutter/material.dart';

const primaryColor = Colors.lightGreenAccent;

final colorSchemeLight = ColorScheme.fromSeed(
  seedColor: primaryColor,
);

final colorSchemeDark = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: primaryColor,
);

ThemeData lightTheme = ThemeData(
  primaryColor: primaryColor,
  colorScheme: colorSchemeLight,
  useMaterial3: true,
);

ThemeData darkTheme = ThemeData(
  primaryColor: primaryColor,
  colorScheme: colorSchemeDark,
  useMaterial3: true,
);
