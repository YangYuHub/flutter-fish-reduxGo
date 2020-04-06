import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<LanguageState> buildReducer() {
  return asReducer(
    <Object, Reducer<LanguageState>>{
      LanguageAction.action: _onAction,
    },
  );
}

LanguageState _onAction(LanguageState state, Action action) {
  final LanguageState newState = state.clone();
  return newState;
}
