import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum TabNavigationAction { action }

class TabNavigationActionCreator {
  static Action onAction() {
    return const Action(TabNavigationAction.action);
  }
}
