import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum LanguageAction { action ,globalResources}

class LanguageActionCreator {
  static Action onAction() {
    return const Action(LanguageAction.action);
  }
   static Action globalResources(var resources) {
    return Action(LanguageAction.globalResources, payload: resources);
  }
}
