import 'package:common_utils/common_utils.dart';
import 'package:flutter_deer/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_deer/util/toast_tools.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';

import 'navigator_utils.dart';

class CommonUtils {
  static Future<Null> showLoadingDialog(BuildContext context) {
    return NavigatorUtils.showCFDialog(
      context: context,
      builder: (BuildContext context) {
        return new Material(
          color: Colors.transparent,
          child: WillPopScope(
            onWillPop: () => new Future.value(false),
            child: Center(
              child: new Container(
                width: 120.0,
                height: 120.0,
                padding: new EdgeInsets.all(4.0),
                decoration: new BoxDecoration(
                  color: Colors.transparent,
                  //用一个BoxDecoration装饰器提供背景图片
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(child: SpinKitCubeGrid(color: Colors.white)),
                    new Container(height: 10.0),
                    new Container(
                        child: new Text("Loading···",
                            style: TextStyle(color: Colors.white))),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<Null> showConfirmDialog(
      BuildContext context,
      String cancelTitle,
      String title,
      Widget content,
      String confirmTilte,
      Function onChange) {
    return NavigatorUtils.showCFDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Color.fromRGBO(56, 56, 56, 1),
        titleTextStyle: TextStyle(color: Colors.white),
        contentTextStyle: TextStyle(color: Colors.white),
        title: Text(title ?? 'Dialog'),
        content: content ?? Text(('Dialog content..')),
        // actions: <Widget>[
        //   OutlineButton(
        //     borderSide: BorderSide(color: Color.fromRGBO(125, 80, 219, 1)),
        //     padding: EdgeInsets.all(0),
        //     child: Text(
        //       cancelTitle ?? "Cancel",
        //       style: TextStyle(color: Colors.white, fontSize: 14),
        //     ),
        //     onPressed: () {
        //       Navigator.of(context).pop();
        //     },
        //   ),
        //   RaisedButton(
        //     color: Color.fromRGBO(125, 80, 219, 0.96),
        //     child: new Text(
        //       confirmTilte ?? "Change",
        //       style: TextStyle(fontSize: 14),
        //     ),
        //     onPressed: () {
        //       Navigator.of(context).pop();
        //       onChange();
        //     },
        //   )
        // ],
      ),
    );
  }

  static String formatComma3and4(String value, int fractionDigits) {
    value = (value == "") || (value == "null") || (value == null) ? "0" : value;

    var byStr = NumUtil.getNumByValueStr(value, fractionDigits: fractionDigits)
        .toString();
    var sp = byStr.split(".");
    if (byStr.contains("-")) {
      value =
          "-${TextUtil.formatComma3(sp[0].replaceFirst("-", ""))}${sp[1] != "" ? "." + sp[1] : ""}";
    } else {
      value =
          "${TextUtil.formatComma3(sp[0])}${sp[1] != "" ? "." + sp[1] : ""}";
    }
    return value;
  }

  static toPage(String route, BuildContext context,
      [dynamic params = null]) async {
    // if (!SpUtil.getBool(Config.IS_LOGIN) && route == RoutePath.BALANCES_PAGE) {
    //   Navigator.push(
    //     context,
    //     PageRouteBuilder(
    //       transitionDuration: Duration(milliseconds: 200), //动画时间为500毫秒
    //       pageBuilder: (BuildContext context, Animation animation,
    //           Animation secondaryAnimation) {
    //         return new FadeTransition(
    //           //使用渐隐渐入过渡,
    //           opacity: animation,
    //           child: AppRoute.global
    //               .buildPage(RoutePath.LOGIN_PAGE, {"page": route}),
    //         );
    //       },
    //     ),
    //   );
    // } else {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 200), //动画时间为500毫秒
        pageBuilder: (BuildContext context, Animation animation,
            Animation secondaryAnimation) {
          return new FadeTransition(
            //使用渐隐渐入过渡,
            opacity: animation,
            child: AppRoute.global.buildPage(route, params),
          );
        },
      ),
    );
    // }
  }

  //复制到剪粘板
  static copy(String text) {
    ClipboardData clipboardData = ClipboardData(text: text ?? "");
    Clipboard.setData(clipboardData);
    ToastTools.showToast("Copy success");
  }

  //登录密码：8~16位数字和字符组合
  static bool isLoginPasswordV(String input) {
    RegExp mobile = new RegExp(r"(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$");
    return mobile.hasMatch(input);
  }

  //登录密码：8~16位数字和字符组合
  static bool isLoginPassword(String input) {
    RegExp mobile = new RegExp(r"(?![a-zA-Z]+$)|[0-9A-Za-z]{8,16}$");
    return mobile.hasMatch(input);
  }

  //登录密码：6位数字验证码
  static bool isValidateCaptcha(String input) {
    RegExp mobile = new RegExp(r"\d{6}$");
    return mobile.hasMatch(input);
  }

  static openYoutube() async {
    // Android
    const url = 'vnd.authy://';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      //  Ios
      const url = 'authy://';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  //返回两个日期相差的天数
  static int daysBetween(DateTime a, DateTime b, [bool ignoreTime = false]) {
    if (ignoreTime) {
      int v = a.millisecondsSinceEpoch ~/ 86400000 -
          b.millisecondsSinceEpoch ~/ 86400000;
      if (v < 0) return -v;
      return v;
    } else {
      int v = a.millisecondsSinceEpoch - b.millisecondsSinceEpoch;
      if (v < 0) v = -v;
      return v ~/ 86400000;
    }
  }

  //UTC转北京时间
  static DateTime utcToDateTime(String utcDateTime) {
    return DateTime.parse("${utcDateTime.substring(0, 19)}-0800");
  }

  //返回当前时间戳
  static int currentTimeMillis() {
    return new DateTime.now().millisecondsSinceEpoch;
  }

  
}
