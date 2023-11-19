import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF00ADB5), //cyan color bottom containers
    onPrimary: Colors.white, // color for Texts in white
    secondary: Color(0xFF393E46), // gray background color for buttons
    onSecondary: Colors.white, // bottom text colors
    error: Colors.red,
    onError: Colors.white,
    background: Color(0xFF393E46), // grey color scaffold background
    onBackground: Colors.black,
    surface: Color(0xFFFFFFFF),
    onSurface: Colors.black,
    onInverseSurface: Colors.blue
  ),
  // Add other theme configurations as needed
);
