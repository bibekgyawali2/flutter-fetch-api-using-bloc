import 'package:bloc/bloc.dart';
import 'package:covid_api/cubit/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class SwitchCubit extends Cubit<SwitchState> {
  SwitchCubit() : super(SwitchState(isDarkThemeOn: true));

  void toggleSwitch(bool value) => emit(state.copyWith(changeState: value));
}
