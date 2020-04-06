import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_deer/app_route.dart';
import 'package:flutter_deer/app_route.dart';
import 'package:flutter_deer/setting/widgets/update_dialog.dart';
import 'package:flutter_deer/setting/widgets/exit_dialog.dart';
import 'package:flutter_deer/common/common.dart';
import 'package:flutter_deer/setting/setting_router.dart';
import 'package:flutter_deer/routers/fluro_navigator.dart';
import 'package:flutter_deer/util/common_utils.dart';
import 'package:flutter_deer/widgets/click_item.dart';
import 'package:flutter_deer/res/resources.dart';
import 'package:flutter_deer/widgets/app_bar.dart';
import 'package:flustars/flustars.dart' as flutter_stars;
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SettingState state, Dispatch dispatch, ViewService viewService) {
  String theme = flutter_stars.SpUtil.getString(Constant.theme);
  String themeMode;
  switch (theme) {
    case 'Dark':
      themeMode = '开启';
      break;
    case 'Light':
      themeMode = '关闭';
      break;
    default:
      themeMode = '跟随系统';
      break;
  }

  return Scaffold(
    appBar: const MyAppBar(
      centerTitle: '设置',
    ),
    body: Column(
      children: <Widget>[
        Gaps.vGap5,
        ClickItem(
            title: '账号管理',
            onTap: () => NavigatorUtils.push(
                viewService.context, SettingRouter.accountManagerPage)),
        ClickItem(title: '清除缓存', content: '23.5MB', onTap: () {}),
        ClickItem(
            title: '夜间模式',
            content: themeMode,
            onTap: () =>
                CommonUtils.toPage(RoutePath.THEMT, viewService.context)),
        ClickItem(
            title: '检查更新', onTap: () => _showUpdateDialog(viewService.context)),
        ClickItem(
            title: '关于我们',
            onTap: () => NavigatorUtils.push(
                viewService.context, SettingRouter.aboutPage)),
        ClickItem(
          title: '退出当前账号',
          onTap: () => _showExitDialog(viewService.context),
        ),
      ],
    ),
  );
}

void _showExitDialog(context) {
  showDialog(context: context, builder: (_) => ExitDialog());
}

void _showUpdateDialog(context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => UpdateDialog());
}
