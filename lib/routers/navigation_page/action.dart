import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum NavigationAction { action }

class NavigationActionCreator {
  static Action onAction() {
    return const Action(NavigationAction.action);
  }
}
