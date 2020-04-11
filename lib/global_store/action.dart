import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';

enum GlobalAction { changeThemeColor, changelanguage}

class GlobalActionCreator {
  static Action changeThemeColor(int i) {
    return  Action(GlobalAction.changeThemeColor,payload: i);
  }

  static Action changeLanguage(String language) {
    return Action(GlobalAction.changelanguage, payload: language);
  }

}
