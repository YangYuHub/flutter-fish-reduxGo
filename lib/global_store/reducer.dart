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
    },
  );
}

GlobalState _changeThemeColor(GlobalState state, prefix0.Action action) {
  int _themeIndex = action.payload;
  GlobalState _globalState = state.clone();
  _globalState.theme=_themeIndex;
  return _globalState;
}

GlobalState _changeLanguage(GlobalState state, prefix0.Action action) {
  GlobalState _globalState = state.clone();
  String _lanauage = action.payload;
  if(_lanauage=="en"){
    _globalState.languageLocale = Locale('en', 'US');
  }else{
    _globalState.languageLocale  = Locale('zh', 'CN');
  }
  return _globalState;
}
