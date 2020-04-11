import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<LoginState> buildReducer() {
  return asReducer(
    <Object, Reducer<LoginState>>{
      LoginAction.action: _onAction,
      LoginAction.check: _onCheck,
      LoginAction.onLoading: _onLoading
    },
  );
}

LoginState _onAction(LoginState state, Action action) {
  final LoginState newState = state.clone();
  return newState;
}

LoginState _onCheck(LoginState state, Action action) {
  final LoginState newState = state.clone();
  newState.isClick = action.payload;
  return newState;
}

LoginState _onLoading(LoginState state, Action action) {
  final LoginState newState = state.clone();
  newState.loading = action.payload;
  return newState;
}
