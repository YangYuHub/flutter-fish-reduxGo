import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class OrderState implements Cloneable<OrderState> {
  bool get wantKeepAlive => true;

  TabController tabController;

  int lastReportedPage = 0;
  bool isDark;
  @override
  OrderState clone() {
    return OrderState();
  }
}

OrderState initState(Map<String, dynamic> args) {
  return OrderState();
}
