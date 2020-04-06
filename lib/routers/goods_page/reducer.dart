import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<GoodsState> buildReducer() {
  return asReducer(
    <Object, Reducer<GoodsState>>{
      GoodsAction.action: _onAction,
    },
  );
}

GoodsState _onAction(GoodsState state, Action action) {
  final GoodsState newState = state.clone();
  return newState;
}
