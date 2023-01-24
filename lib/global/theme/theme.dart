import 'package:flutter/material.dart';

enum AppTheme {
  LightAppTheme,
  DarkAppTheme,
}

final appThemeData = {
  AppTheme.DarkAppTheme: ThemeData(
    scaffoldBackgroundColor: Colors.grey[600],
    primarySwatch: Colors.grey,
    cardColor: Colors.grey,
    fontFamily: 'poppins',
  ),
  AppTheme.LightAppTheme: ThemeData(
    scaffoldBackgroundColor: Colors.green[200],
    primarySwatch: Colors.green,
    cardColor: Colors.green[100],
  ),
};
