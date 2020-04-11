import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_deer/global_store/state.dart';

class ThemeState implements GlobalBaseState<ThemeState> {
  
  @override
  int theme;

  @override
  ThemeState clone() {
    return ThemeState()
      ..theme = theme;
  }

  @override
  bool isAtNight;

  @override
  Locale languageLocale;
}

ThemeState initState(Map<String, dynamic> args) {
  return ThemeState();
}
