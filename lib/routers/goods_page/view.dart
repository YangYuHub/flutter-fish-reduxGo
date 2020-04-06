import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_deer/widgets/app_bar.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(GoodsState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
      appBar: MyAppBar(
        isBack: false,
        actionName: '',
        centerTitle: "goods",
        onPressed: () {
          // NavigatorUtils.push(viewService.context, LoginRouter.smsLoginPage);
        },
      ),
      body: Container(
        height: 100,
        child: Text("order"),
      ));
}
