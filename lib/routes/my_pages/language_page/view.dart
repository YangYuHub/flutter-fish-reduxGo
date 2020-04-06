import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    LanguageState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Column(
        children: <Widget>[
          Text("语言设置"),
        ],
      ),
      backgroundColor: Color.fromRGBO(46, 53, 58, 1),
      centerTitle: true,
    ),
    backgroundColor: Colors.white,
    body: Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[Text("Engish"), Icon(Icons.label)],
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
            children: <Widget>[Text("中文"), Icon(Icons.label)],
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
            children: <Widget>[Text("跟随系统"), Icon(Icons.label)],
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
