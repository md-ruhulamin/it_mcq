import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,

  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue,
    onSurface: Colors.grey.shade300,
    primary: Colors.grey.shade500,
    tertiary: Colors.grey,
    inversePrimary: Colors.grey.shade800,
  ),
);
//       // This call to setState tells the Flutter framework that something has