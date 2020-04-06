import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';

abstract class GlobalBaseState<T extends Cloneable<T>> implements Cloneable<T> {
  Color get themeColor;
  set themeColor(Color color);
  Locale get languageLocale;
  set languageLocale(Locale languageLocale);
  bool get isAtNight;
  set isAtNight(bool isAtNight);
}

class GlobalState implements GlobalBaseState<GlobalState> {
  @override
  Color themeColor;
  @override
  Locale languageLocale;
  @override
  bool isAtNight;

  @override
  GlobalState clone() {
    // TODO: implement clone
    return GlobalState()
      ..themeColor = themeColor
      ..isAtNight = isAtNight
      ..languageLocale = languageLocale;
  }
}
