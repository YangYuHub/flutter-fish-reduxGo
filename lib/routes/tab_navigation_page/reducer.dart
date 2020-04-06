import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<TabNavigationState> buildReducer() {
  return asReducer(
    <Object, Reducer<TabNavigationState>>{
      TabNavigationAction.action: _onAction,
    },
  );
}

TabNavigationState _onAction(TabNavigationState state, Action action) {
  final TabNavigationState newState = state.clone();
  return newState;
}
