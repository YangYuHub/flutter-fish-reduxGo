import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ThemeState> buildReducer() {
  return asReducer(
    <Object, Reducer<ThemeState>>{
      ThemeAction.action: _onAction,
    },
  );
}

ThemeState _onAction(ThemeState state, Action action) {
  final ThemeState newState = state.clone();
  return newState;
}
