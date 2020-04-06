import 'package:fish_redux/fish_redux.dart';
import 'package:fish_redux_app_go/app_route.dart';
import 'package:fish_redux_app_go/i10n/localization_intl.dart';
import 'package:fish_redux_app_go/widgets/main_bottom_pages_load_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    TabNavigationState state, Dispatch dispatch, ViewService viewService) {
  ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)
    ..init(viewService.context);
  return Scaffold(
    backgroundColor: Color.fromRGBO(47, 53, 58, 1), // Bottom
    body: SafeArea(
      top: false,
      child: TabNavigation(),
    ),
  );
}

class TabNavigation extends StatefulWidget {
  @override
  _TabNavigationState createState() => new _TabNavigationState();
}

class _TabNavigationState extends State<TabNavigation> {
  final _defautColor = Colors.grey;
  final _activeColor = Color.fromRGBO(125, 80, 219, 1);
  int _currentIndex = 0;
  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    // eventBus.destroy();
  }

  @override
  Widget build(BuildContext context) {
    var gm = AppLocalizations.of(context);
    //设置适配尺寸 (填入设计稿中设备的屏幕尺寸) 此处假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)
    //设置字体大小根据系统的“字体大小”辅助选项来进行缩放,默认为false
    return Scaffold(
      backgroundColor: Color.fromRGBO(47, 53, 58, 1), // BottomNavigationBar背景色,
      body: PageView(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          MainBottomPagesLoadMode(
              AppRoute.global.buildPage(RoutePath.HOME, null), ""),
          AppRoute.global.buildPage(RoutePath.HOME, null),
          MainBottomPagesLoadMode(
              AppRoute.global.buildPage(RoutePath.MY, null), ""),
        ],
        onPageChanged: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      // resizeToAvoidBottomPadding: false,
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          currentIndex: _currentIndex,
          onTap: (index) {
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
          fixedColor: Color.fromRGBO(125, 80, 219, 1),
          backgroundColor:
              Color.fromRGBO(47, 53, 58, 1), // BottomNavigationBar背景色,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.assessment,
                color: _defautColor,
              ),
              activeIcon: Icon(
                Icons.assessment,
                color: _activeColor,
              ),
              title: Text(
                gm.home,
                style: TextStyle(
                    color: _currentIndex != 0 ? _defautColor : _activeColor),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.local_atm,
                color: _defautColor,
              ),
              activeIcon: Icon(
                Icons.local_atm,
                color: _activeColor,
              ),
              title: Text(
                'Lend',
                style: TextStyle(
                    color: _currentIndex != 1 ? _defautColor : _activeColor),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.local_atm,
                color: _defautColor,
              ),
              activeIcon: Icon(
                Icons.local_atm,
                color: _activeColor,
              ),
              title: Text(
                'My',
                style: TextStyle(
                    color: _currentIndex != 2 ? _defautColor : _activeColor),
              ),
            ),
          ]),
    );
  }
}
