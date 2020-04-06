import 'package:fish_redux/fish_redux.dart';

class TabNavigationState implements Cloneable<TabNavigationState> {

  @override
  TabNavigationState clone() {
    return TabNavigationState();
  }
}

TabNavigationState initState(Map<String, dynamic> args) {
  return TabNavigationState();
}
