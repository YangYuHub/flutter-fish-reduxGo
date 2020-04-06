import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Column(
        children: <Widget>[
          Text("HomePage"),
        ],
      ),
      backgroundColor: Color.fromRGBO(46, 53, 58, 1),
      centerTitle: true,
    ),
    backgroundColor: Color.fromRGBO(32, 40, 45, 1),
    body: Text("HomePage-Text"),
  );
}
