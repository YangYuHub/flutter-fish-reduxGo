import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<LanguageState> buildEffect() {
  return combineEffects(<Object, Effect<LanguageState>>{
    LanguageAction.action: _onAction,
  });
}

void _onAction(Action action, Context<LanguageState> ctx) {
}
