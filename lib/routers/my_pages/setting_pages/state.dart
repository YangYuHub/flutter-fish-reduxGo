import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_deer/global_store/state.dart';

class SettingState implements GlobalBaseState<SettingState> {
  @override
  SettingState clone() {
    return SettingState()
      ..theme = theme
      ..languageLocale = languageLocale;
  }

  @override
  bool isAtNight;

  @override
  Locale languageLocale;

  @override
  int theme;
}

SettingState initState(Map<String, dynamic> args) {
  return SettingState();
}
