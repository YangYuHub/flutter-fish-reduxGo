import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum LanguageAction { action }

class LanguageActionCreator {
  static Action onAction() {
    return const Action(LanguageAction.action);
  }
}
