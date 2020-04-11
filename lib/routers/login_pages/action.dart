import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum LoginAction { action, login, check, onLoading }

class LoginActionCreator {
  static Action onAction() {
    return const Action(LoginAction.action);
  }

  static Action onLogin() {
    return const Action(LoginAction.login);
  }

  static Action onCheck(bool check) {
    return Action(LoginAction.check, payload: check);
  }

  static Action onLoading(bool check) {
    return Action(LoginAction.onLoading, payload: check);
  }
}
