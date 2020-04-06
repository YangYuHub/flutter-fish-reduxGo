import 'package:fish_redux/fish_redux.dart';
import 'package:fish_redux_app_go/app_route.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(MyState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Column(
        children: <Widget>[
          Text("My"),
        ],
      ),
      elevation: 0,
      backgroundColor: Color.fromRGBO(46, 53, 58, 1),
      centerTitle: true,
    ),
    backgroundColor: Colors.white,
    body: Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(
              viewService.context,
              PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 200), //动画时间为500毫秒
                pageBuilder: (BuildContext context, Animation animation,
                    Animation secondaryAnimation) {
                  return new FadeTransition(
                    //使用渐隐渐入过渡,
                    opacity: animation,
                    child: AppRoute.global.buildPage(RoutePath.LANGUAGE, null),
                  );
                },
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[Text("切换语言"), Icon(Icons.ac_unit)],
            ),
          ),
        ),
        Container(
          height: 1,
          color: Colors.black,
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[Text("切换主题"), Icon(Icons.ac_unit)],
          ),
        ),
        Container(
          height: 1,
          color: Colors.black,
        )
      ],
    ),
  );
}
