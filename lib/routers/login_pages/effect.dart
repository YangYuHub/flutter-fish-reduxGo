import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_deer/app_route.dart';
import 'package:flutter_deer/app_route.dart';
import 'package:flutter_deer/store/store_router.dart';
import 'package:flutter_deer/routers/fluro_navigator.dart';
import 'package:flutter_deer/common/common.dart';
import 'package:flustars/flustars.dart' as FlutterStars;
import 'package:flutter_deer/util/common_utils.dart';
import 'action.dart';
import 'state.dart';

Effect<LoginState> buildEffect() {
  return combineEffects(<Object, Effect<LoginState>>{
    LoginAction.action: _onAction,
    LoginAction.login: _onLogin,
    Lifecycle.initState: _initState,
  });
}

void _initState(Action action, Context<LoginState> ctx) async {
  //监听输入改变
  // ctx.state.nameController.addListener(_verify(action, ctx));
  // ctx.state.passwordController.addListener(_verify(action, ctx));
  // ctx.state.nameController.text = FlutterStars.SpUtil.getString(Constant.phone);
}

void _onAction(Action action, Context<LoginState> ctx) {}

void _onLogin(Action action, Context<LoginState> ctx) {
  FlutterStars.SpUtil.putString(Constant.phone, ctx.state.nameController.text);
  // NavigatorUtils.push(ctx.context, RoutePath.NAVIGATION);
  CommonUtils.toPage(RoutePath.NAVIGATION, ctx.context, null);
}

_verify(Action action, Context<LoginState> ctx) {
  String name = ctx.state.nameController.text;
  String password = ctx.state.passwordController.text;
  bool isClick = true;
  if (name.isEmpty || name.length < 11) {
    isClick = false;
  }
  if (password.isEmpty || password.length < 6) {
    isClick = false;
  }

  /// 状态不一样在刷新，避免重复不必要的setState
  if (isClick != ctx.state.isClick) {
    // ctx.state.isClick = isClick;
    ctx.dispatch(LoginActionCreator.onCheck(isClick));
  }
}
