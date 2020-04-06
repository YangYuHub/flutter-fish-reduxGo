import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<ThemeState> buildEffect() {
  return combineEffects(<Object, Effect<ThemeState>>{
    ThemeAction.action: _onAction,
  });
}

void _onAction(Action action, Context<ThemeState> ctx) {
}
