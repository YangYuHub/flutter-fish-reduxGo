import 'package:fish_redux/fish_redux.dart';

class LanguageState implements Cloneable<LanguageState> {

  @override
  LanguageState clone() {
    return LanguageState();
  }
}

LanguageState initState(Map<String, dynamic> args) {
  return LanguageState();
}
