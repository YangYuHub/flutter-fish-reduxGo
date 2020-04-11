import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_deer/app_route.dart';
import 'package:flutter_deer/common/cache/sp_util.dart';
import 'package:flutter_deer/common/config/config.dart';
import 'package:flutter_deer/i10n/localization_intl.dart';
import 'package:flutter_deer/util/common_utils.dart';
import 'package:flutter_deer/widgets/app_bar.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    LanguageState state, Dispatch dispatch, ViewService viewService) {
  println(Theme.of(viewService.context).accentColor);

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
  var _list = ['跟随系统', '中文', 'English'];
  return Scaffold(
    appBar: MyAppBar(title: AppLocalizations.of(viewService.context).language),
    body: ListView.separated(
        shrinkWrap: true,
        itemCount: _list.length,
        separatorBuilder: (_, index) {
          return const Divider();
        },
        itemBuilder: (_, index) {
          return InkWell(
            onTap: () {
              dispatch(LanguageActionCreator.globalResources(index == 1
                  ? "zh"
                  : index == 2
                      ? "en"
                      : SpUtil.getString(Config.NATIVE_LANGUAGE)));

              println("TestThemeState-------" +
                  AppLocalizations.of(viewService.context).title);

              // Navigator.pop(viewService.context);
              //   CommonUtils.toPage(RoutePath.SETTING, viewService.context);
            },
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              height: 50.0,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(_list[index]),
                  ),
                  Opacity(
                      opacity: languageMode == _list[index] ? 1 : 0,
                      child: Icon(Icons.done, color: Colors.blue))
                ],
              ),
            ),
          );
        }),
  );
}
