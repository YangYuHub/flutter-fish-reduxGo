import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ThemeAction { action }

class ThemeActionCreator {
  static Action onAction() {
    return const Action(ThemeAction.action);
  }
}
