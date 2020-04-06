import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_deer/res/gaps.dart';
import 'package:flutter_deer/widgets/app_bar.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPage createState() => _TestPage();
}

class _TestPage extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(
          centerTitle: '资金管理',
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Gaps.vGap5,
            ],
          ),
        ));
  }
}
