import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<GoodsState> buildEffect() {
  return combineEffects(<Object, Effect<GoodsState>>{
    GoodsAction.action: _onAction,
  });
}

void _onAction(Action action, Context<GoodsState> ctx) {
}
