import 'package:fish_redux/fish_redux.dart';
import 'package:fish_redux_app_go/app_route.dart';
import 'package:fish_redux_app_go/common/cache/sp_util.dart';
import 'package:flutter/cupertino.dart' as cup;
import 'action.dart';
import 'state.dart';

Effect<SplashState> buildEffect() {
  return combineEffects(<Object, Effect<SplashState>>{
    SplashAction.action: _onAction,
    Lifecycle.initState: _initState,
  });
}

void _onAction(Action action, Context<SplashState> ctx) {}

void _initState(Action action, Context<SplashState> ctx) async {
  await SpUtil.getInstance();
  startHome(action, ctx);
}

//显示2秒后跳转到HomeTabPage
startHome(Action action, Context<SplashState> ctx) async {
  await Future.delayed(const Duration(milliseconds: 1500), () {
    cup.Navigator.of(ctx.context).pushNamedAndRemoveUntil(
        RoutePath.TAB_NAVIGATION, (cup.Route<dynamic> route) => false);
  });
}
