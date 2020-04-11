import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_deer/common/common.dart';
import 'package:flutter_deer/common/constants/global_theme_styles.dart';
import 'package:flutter_deer/global_store/action.dart';
import 'package:flutter_deer/global_store/store.dart';
import 'package:flutter_deer/widgets/app_bar.dart';
import 'package:flustars/flustars.dart' as flutter_stars;
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(ThemeState state, Dispatch dispatch, ViewService viewService) {
  String theme = flutter_stars.SpUtil.getString(Constant.theme);
  var _list = ['跟随系统', '开启', '关闭'];
  String themeMode;
  switch (theme) {
    case 'Dark':
      themeMode = _list[1];
      break;
    case 'Light':
      themeMode = _list[2];
      break;
    default:
      themeMode = _list[0];
      break;
  }
  return Scaffold(
    appBar: MyAppBar(
      backgroundColor: GlobalThemeStyles.backGroundColor[state.theme],
      title: '夜间模式',
      titleColor: GlobalThemeStyles.baseTitleColor[state.theme],
      iconColor: GlobalThemeStyles.baseTitleColor[state.theme],
    ),
    backgroundColor:GlobalThemeStyles.backGroundColor[state.theme],
    body: ListView.separated(
        shrinkWrap: true,
        itemCount: _list.length,
        separatorBuilder: (_, index) {
          return const Divider();
        },
        itemBuilder: (_, index) {
          return InkWell(
            onTap: () {
              GlobalStore.store
                  .dispatch(GlobalActionCreator.changeThemeColor(index));
            },
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              height: 50.0,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(_list[index],style: TextStyle(color:GlobalThemeStyles.baseTitleColor[state.theme] ),),
                  ),
                  Opacity(
                      opacity: themeMode == _list[index] ? 1 : 0,
                      child: Icon(Icons.done, color: Colors.blue))
                ],
              ),
            ),
          );
        }),
  );
}
