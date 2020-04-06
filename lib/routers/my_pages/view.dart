import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_deer/util/image_utils.dart';
import 'package:flutter_deer/account/account_router.dart';
import 'package:flutter_deer/shop/shop_router.dart';
import 'package:flutter_deer/routers/fluro_navigator.dart';
import 'package:flutter_deer/res/resources.dart';
import 'package:flutter_deer/util/theme_utils.dart';
import 'package:flutter_deer/widgets/load_image.dart';
import 'package:flutter_deer/app_route.dart';
import 'package:flutter_deer/util/common_utils.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(MyState state, Dispatch dispatch, ViewService viewService) {
  final Color _iconColor = ThemeUtils.getIconColor(viewService.context);
  var _menuTitle = ['账户流水', '资金管理', '提现账号'];
  var _menuImage = ['zhls', 'zjgl', 'txzh'];
  var _menuDarkImage = ['dark_zhls', 'dark_zjgl', 'dark_txzh'];
  return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[
          IconButton(
            tooltip: '消息',
            onPressed: () {
              // NavigatorUtils.push(context, ShopRouter.messagePage);
            },
            icon: LoadAssetImage(
              'shop/message',
              key: const Key('message'),
              width: 24.0,
              height: 24.0,
              color: _iconColor,
            ),
          ),
          IconButton(
            tooltip: '设置',
            onPressed: () {
              // NavigatorUtils.push(context, SettingRouter.settingPage);
              CommonUtils.toPage(RoutePath.SETTING, viewService.context, null);
            },
            icon: LoadAssetImage(
              'shop/setting',
              key: const Key('setting'),
              width: 24.0,
              height: 24.0,
              color: _iconColor,
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Gaps.vGap12,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: MergeSemantics(
              child: Stack(
                children: <Widget>[
                  const SizedBox(width: double.infinity, height: 56.0),
                  const Text(
                    '官方直营店',
                    style: TextStyles.textBold24,
                  ),
                  Positioned(
                      right: 0.0,
                      child: CircleAvatar(
                        radius: 28.0,
                        backgroundColor: Colors.transparent,
                        // backgroundImage: ImageUtils.getImageProvider(provider.user?.avatarUrl, holderImg: 'shop/tx')
                      )),
                  Positioned(
                    top: 38.0,
                    left: 0.0,
                    child: Row(
                      children: <Widget>[
                        const LoadAssetImage(
                          'shop/zybq',
                          width: 40.0,
                          height: 16.0,
                        ),
                        Gaps.hGap8,
                        const Text('店铺账号:15000000000',
                            style: TextStyles.textSize12)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Gaps.vGap24,
          Container(
            height: 0.6,
            width: double.infinity,
            margin: const EdgeInsets.only(left: 16.0),
            child: Gaps.line,
          ),
          Gaps.vGap24,
          const MergeSemantics(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text(
                '账户',
                style: TextStyles.textBold18,
              ),
            ),
          ),
          Flexible(
            child: GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 12.0),
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, childAspectRatio: 1.18),
              itemCount: _menuTitle.length,
              itemBuilder: (_, index) {
                return InkWell(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      LoadAssetImage(ThemeUtils.isDark(viewService.context) ? 'shop/${_menuDarkImage[index]}' : 'shop/${_menuImage[index]}', width: 32.0),
                      Gaps.vGap4,
                      Text(
                        _menuTitle[index],
                        style: TextStyles.textSize12,
                      )
                    ],
                  ),
                  onTap: () {
                    if (index == 0) {
                      NavigatorUtils.push(viewService.context,
                          AccountRouter.accountRecordListPage);
                    } else if (index == 1) {
                      NavigatorUtils.push(
                          viewService.context, AccountRouter.accountPage);
                    } else if (index == 2) {
                      NavigatorUtils.push(viewService.context,
                          AccountRouter.withdrawalAccountPage);
                    }
                  },
                );
              },
            ),
          ),
          Container(
            height: 0.6,
            width: double.infinity,
            margin: const EdgeInsets.only(left: 16.0),
            child: Gaps.line,
          ),
          Gaps.vGap24,
          const MergeSemantics(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text(
                '店铺',
                style: TextStyles.textBold18,
              ),
            ),
          ),
          Flexible(
            child: GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 12.0),
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, childAspectRatio: 1.18),
              itemCount: 1,
              itemBuilder: (_, index) {
                return InkWell(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      LoadAssetImage(
                          ThemeUtils.isDark(viewService.context)
                              ? 'shop/dark_dpsz'
                              : 'shop/dpsz',
                          width: 32.0),
                      Gaps.vGap4,
                      const Text(
                        '店铺设置',
                        style: TextStyles.textSize12,
                      )
                    ],
                  ),
                  onTap: () => NavigatorUtils.push(
                      viewService.context, ShopRouter.shopSettingPage),
                );
              },
            ),
          ),
        ],
      ));
}
