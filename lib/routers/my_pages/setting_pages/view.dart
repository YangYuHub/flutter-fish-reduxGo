import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_deer/app_route.dart';
import 'package:flutter_deer/app_route.dart';
import 'package:flutter_deer/common/cache/sp_util.dart';
import 'package:flutter_deer/common/config/config.dart';
import 'package:flutter_deer/common/constants/global_theme_styles.dart';
import 'package:flutter_deer/i10n/localization_intl.dart';
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

  String language = SpUtil.getString(Config.LOCAL_THEME_LOCALE_KEY);
  String languageMode;
  switch (language) {
    case 'en':
      languageMode = 'English';
      break;
    case 'zh':
      languageMode = '中文';
      break;
    default:
      languageMode = '跟随系统';
      break;
  }

  return Scaffold(
    appBar: MyAppBar(
        centerTitle: '设置',
        backgroundColor: GlobalThemeStyles.backGroundColor[state.theme],
        titleColor: GlobalThemeStyles.baseTitleColor[state.theme],
        iconColor: GlobalThemeStyles.baseTitleColor[state.theme],
        onPressed: () {
          CommonUtils.toPage(RoutePath.MY, viewService.context);
        }),
    backgroundColor: GlobalThemeStyles.backGroundColor[state.theme],
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
            title: AppLocalizations.of(viewService.context).language,
            content: languageMode,
            onTap: () =>
                CommonUtils.toPage(RoutePath.LANGUAGE, viewService.context)),
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
