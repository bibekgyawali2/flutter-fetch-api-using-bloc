import 'package:covid_api/global/theme/theme.dart';
import 'package:flutter/material.dart';

class SwitchState {
  final bool isDarkThemeOn;
  late ThemeData theme;
  SwitchState({required this.isDarkThemeOn}) {
    if (isDarkThemeOn) {
      theme = appThemeData[AppTheme.DarkAppTheme] as ThemeData;
    } else {
      theme = appThemeData[AppTheme.LightAppTheme] as ThemeData;
    }
  }

  SwitchState copyWith({required bool changeState}) {
    return SwitchState(isDarkThemeOn: changeState);
  }
}
