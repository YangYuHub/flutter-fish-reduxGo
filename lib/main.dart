import 'package:flutter_deer/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deer/common/cache/sp_util.dart';
import 'package:flutter_deer/common/config/config.dart';
import 'package:flutter_deer/common/constants/unified_theme_styles.dart';
import 'package:flutter_deer/common/event/index.dart';
import 'package:flutter_deer/common/local/local_storage.dart';
import 'package:flutter_deer/global_store/action.dart';
import 'package:flutter_deer/global_store/store.dart';
import 'package:flutter_deer/i10n/localization_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() =>
    LocalStorage.checnLocalThemeResources().then((e) => runApp(MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _listen(context);
  }

  ///监听主题和国际化切换
  void _listen(context) {
    eventBus.on<GlobalLanguage>().listen((event) {
      if (event != null && event is GlobalLanguage) {
        setState(() {
          if (event.language == "en") {
            UnifiedThemeStyles.themeLocale = Locale('en', 'US');
          } else {
            UnifiedThemeStyles.themeLocale = Locale('zh', 'CN');
          }
//          AppLocalizations.of(context).locale=UnifiedThemeStyles.themeLocale;
          GlobalStore.store
              .dispatch(GlobalActionCreator.changeLanguage(event.language));
          AppLocalizationsDelegate.delegate
              .load(UnifiedThemeStyles.themeLocale);
          LocalStorage.saveLocalThemeResources(event.language);
        });
      } else {}
    });

    eventBus.on<GlobalColor>().listen((event) {
      if (event != null && event is GlobalColor) {
        setState(() {
          UnifiedThemeStyles.themeColor =
              UnifiedThemeStyles.themeColors[event.colorIndex];
        });
        LocalStorage.saveLocalThemeResources(event.colorIndex);
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    LocalStorage.checnLocalThemeResources();
    return new MaterialApp(
      title: 'FLEXlend',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        platform: TargetPlatform.iOS,
        scaffoldBackgroundColor: UnifiedThemeStyles.scaffoldBackgroundColor,
        appBarTheme: AppBarTheme(
            color: UnifiedThemeStyles.scaffoldAppBarColor,
            iconTheme: IconThemeData(color: UnifiedThemeStyles.WHITE),
            textTheme: TextTheme(
                title: TextStyle(
                    fontSize: UnifiedThemeStyles.APP_BAR_TITLE_SIZE,
                    color: UnifiedThemeStyles.WHITE))),
        primaryColor: UnifiedThemeStyles.themeColor,
      ),
      localizationsDelegates: [
        AppLocalizationsDelegate(), // 我们定义的代理
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: UnifiedThemeStyles.themeLocale,
      supportedLocales: <Locale>[
        const Locale('en', 'US'), // 美国英语
        const Locale('zh', 'CN'), // 中文简体
      ],
      // localeResolutionCallback: (deviceLocale, supportedLocales) {
      //   print('deviceLocale: ${deviceLocale.languageCode}');
      //   SpUtil.putString(Config.NATIVE_LANGUAGE, deviceLocale.languageCode);
      // },
      builder: (context, child) {
        /// 保证文字大小不受手机系统设置影响 https://www.kikt.top/posts/flutter/layout/dynamic-text/
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
              textScaleFactor:
                  1.0), // 或者 MediaQueryData.fromWindow(WidgetsBinding.instance.window).copyWith(textScaleFactor: 1.0),
          child: child,
        );
      },
      home: AppRoute.global.buildPage(RoutePath.SPLASH_PAGE, null),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute<Object>(builder: (BuildContext context) {
          return AppRoute.global.buildPage(settings.name, settings.arguments);
        });
      },
    );
  }
}
