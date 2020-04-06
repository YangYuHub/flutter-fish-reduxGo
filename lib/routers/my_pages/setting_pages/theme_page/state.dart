import 'package:fish_redux/fish_redux.dart';

class ThemeState implements Cloneable<ThemeState> {

  @override
  ThemeState clone() {
    return ThemeState();
  }
}

ThemeState initState(Map<String, dynamic> args) {
  return ThemeState();
}
