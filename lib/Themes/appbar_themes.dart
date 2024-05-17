import 'package:flutter/material.dart';

class AppbarThemes{
  static AppBarTheme getAppbarStyle() => const AppBarTheme(
    backgroundColor: Colors.blue,
    surfaceTintColor: Colors.blue,
    foregroundColor: Colors.white,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 24,
    )
  );
}