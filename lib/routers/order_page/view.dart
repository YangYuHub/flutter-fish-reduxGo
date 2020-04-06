import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_deer/widgets/app_bar.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(OrderState state, Dispatch dispatch, ViewService viewService) {
  // return Scaffold(
  //       body: Stack(
  //         children: <Widget>[
  //           /// 像素对齐问题的临时解决方法
  //           SafeArea(
  //             child: SizedBox(
  //               height: 105,
  //               width: double.infinity,
  //               child: state.isDark ? null : const DecoratedBox(
  //                 decoration: BoxDecoration(
  //                   gradient: LinearGradient(colors: const [Color(0xFF5793FA), Color(0xFF4647FA)])
  //                 )
  //               ),
  //             ),
  //           ),
  //           NestedScrollView(
  //             key: const Key('order_list'),
  //             physics: ClampingScrollPhysics(),
  //             headerSliverBuilder: (context, innerBoxIsScrolled) => _sliverBuilder(context),
  //             body: NotificationListener<ScrollNotification>(
  //               onNotification: (ScrollNotification notification) {
  //                 /// PageView的onPageChanged是监听ScrollUpdateNotification，会造成滑动中卡顿。这里修改为监听滚动结束再更新、
  //                 if (notification.depth == 0 && notification is ScrollEndNotification) {
  //                   final PageMetrics metrics = notification.metrics;
  //                   final int currentPage = metrics.page.round();
  //                   if (currentPage != _lastReportedPage) {
  //                     _lastReportedPage = currentPage;
  //                     _onPageChange(currentPage);
  //                   }
  //                 }
  //                 return false;
  //               },
  //               child: PageView.builder(
  //                 key: const Key('pageView'),
  //                 itemCount: 5,
  //                 controller: _pageController,
  //                 itemBuilder: (_, index) => OrderListPage(index: index)
  //               ),
  //             ),
  //           ),
  //         ],
  //     ),
      
  //   );
}
