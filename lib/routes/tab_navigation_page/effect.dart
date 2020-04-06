import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<TabNavigationState> buildEffect() {
  return combineEffects(<Object, Effect<TabNavigationState>>{
    TabNavigationAction.action: _onAction,
  });
}

void _onAction(Action action, Context<TabNavigationState> ctx) {
}
