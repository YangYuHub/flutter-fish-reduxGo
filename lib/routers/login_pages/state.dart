import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

class LoginState implements Cloneable<LoginState> {
  //定义一个controller
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FocusNode nodeText1 = FocusNode();
  final FocusNode nodeText2 = FocusNode();
  bool isClick = true;
  bool loading=false;

  @override
  LoginState clone() {
    return LoginState()..loading = loading;
  }
}

LoginState initState(Map<String, dynamic> args) {
  return LoginState();
}
