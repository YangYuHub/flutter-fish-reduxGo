import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_deer/store/store_router.dart';
import 'package:flutter_deer/common/common.dart';
import 'package:flutter_deer/util/utils.dart';
import 'package:flutter_deer/widgets/my_button.dart';
import 'package:flutter_deer/widgets/text_field.dart';
import 'package:flutter_deer/res/gaps.dart';
import 'package:flutter_deer/res/resources.dart';
import 'package:flutter_deer/widgets/my_scroll_view.dart';
import 'package:flutter_deer/routers/fluro_navigator.dart';
import 'package:flutter_deer/login/login_router.dart';
import 'package:flutter_deer/res/styles.dart';
import 'package:flutter_deer/widgets/app_bar.dart';
import 'package:flustars/flustars.dart' as FlutterStars;
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(LoginState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: MyAppBar(
      isBack: false,
      actionName: '验证码登录',
      onPressed: () {
        NavigatorUtils.push(viewService.context, LoginRouter.smsLoginPage);
      },
    ),
    body: MyScrollView(
      keyboardConfig: Utils.getKeyboardActionsConfig(
          viewService.context, [state.nodeText1, state.nodeText2]),
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
      children: [
        const Text(
          '密码登录',
          style: TextStyles.textBold26,
        ),
        Gaps.vGap16,
        MyTextField(
          key: const Key('phone'),
          focusNode: state.nodeText1,
          controller: state.nameController,
          maxLength: 11,
          keyboardType: TextInputType.phone,
          hintText: '请输入账号',
        ),
        Gaps.vGap8,
        MyTextField(
          key: const Key('password'),
          keyName: 'password',
          focusNode: state.nodeText2,
          isInputPwd: true,
          controller: state.passwordController,
          keyboardType: TextInputType.visiblePassword,
          maxLength: 16,
          hintText: '请输入密码',
        ),
        Gaps.vGap24,
        MyButton(
          key: const Key('login'),
          onPressed: () {
            return state.isClick
                ? dispatch(LoginActionCreator.onLogin())
                : null;
          },
          text: '登录',
        ),
        Container(
          height: 40.0,
          alignment: Alignment.centerRight,
          child: GestureDetector(
            child: Text(
              '忘记密码',
              // style: Theme.of(viewService.context).textTheme.subtitle,
            ),
            onTap: () => NavigatorUtils.push(
                viewService.context, LoginRouter.resetPasswordPage),
          ),
        ),
        Gaps.vGap16,
        Container(
            alignment: Alignment.center,
            child: GestureDetector(
              child: Text(
                '还没账号？快去注册',
                // style: TextStyle(
                //     color: Theme.of(viewService.context).primaryColor),
              ),
              onTap: () => NavigatorUtils.push(
                  viewService.context, LoginRouter.registerPage),
            ))
      ],
    ),
  );
}

void login(state, context) {
  FlutterStars.SpUtil.putString(Constant.phone, state.nameController.text);
  NavigatorUtils.push(context, StoreRouter.auditPage);
}
