import 'package:fish_redux/fish_redux.dart';

class NavigationState implements Cloneable<NavigationState> {

  @override
  NavigationState clone() {
    return NavigationState();
  }
}

NavigationState initState(Map<String, dynamic> args) {
  return NavigationState();
}
