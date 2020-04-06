import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_deer/common/common.dart';
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
    appBar: const MyAppBar(
      title: '夜间模式',
    ),
    body: ListView.separated(
        shrinkWrap: true,
        itemCount: _list.length,
        separatorBuilder: (_, index) {
          return const Divider();
        },
        itemBuilder: (_, index) {
          return InkWell(
            onTap: () {},
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
                      opacity: themeMode == _list[index] ? 1 : 0,
                      child: Icon(Icons.done, color: Colors.blue))
                ],
              ),
            ),
          );
        }),
  );
}
