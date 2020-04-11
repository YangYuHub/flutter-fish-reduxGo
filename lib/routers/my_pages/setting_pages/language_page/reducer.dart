import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_deer/common/event/index.dart';

import 'action.dart';
import 'state.dart';

Reducer<LanguageState> buildReducer() {
  return asReducer(
    <Object, Reducer<LanguageState>>{
      LanguageAction.action: _onAction,
      LanguageAction.globalResources: _globalResources
    },
  );
}

LanguageState _onAction(LanguageState state, Action action) {
  final LanguageState newState = state.clone();
  return newState;
}

LanguageState _globalResources(LanguageState state, Action action) {
  final LanguageState newState = state.clone();
  var resources = action.payload;
  if (resources is int) {
    ///切换主题
    eventBus.fire(GlobalColor(resources));
  } else if (resources is String) {
    ///切换语言
    eventBus.fire(GlobalLanguage(resources));
  }
  return newState;
}
