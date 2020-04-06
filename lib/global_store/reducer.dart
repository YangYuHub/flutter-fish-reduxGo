import 'dart:ui';
import 'package:fish_redux/fish_redux.dart';
import 'package:fish_redux/fish_redux.dart' as prefix0;
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Reducer<GlobalState> buildReducer() {
  return asReducer(
    <Object, Reducer<GlobalState>>{
      GlobalAction.changeThemeColor: _changeThemeColor,
      GlobalAction.changelanguage: _changeLanguage,
      GlobalAction.changeAtNight: _changeAtNight,
    },
  );
}

GlobalState _changeThemeColor(GlobalState state, prefix0.Action action) {
  int _themeColorIndex = action.payload;
  return state.clone();
}

GlobalState _changeLanguage(GlobalState state, prefix0.Action action) {
  GlobalState _globalState = state.clone();
  String _lanauage = action.payload;
  _globalState.languageLocale = Locale(_lanauage, " ");
  return _globalState;
}

GlobalState _changeAtNight(GlobalState state, prefix0.Action action) {
  bool _atNight = action.payload;
//  _atNight ? Screen.setBrightness(0.3) : Screen.setBrightness(-1);
  return state.clone()..isAtNight = _atNight;
}
