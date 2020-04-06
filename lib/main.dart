import 'package:flutter_deer/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deer/common/constants/unified_theme_styles.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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
        // AppLocalizationsDelegate(), // 我们定义的代理
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: UnifiedThemeStyles.themeLocale,
      supportedLocales: <Locale>[
        const Locale('en', 'US'), // 美国英语
        const Locale('zh', 'CN'), // 中文简体
      ],
      home: AppRoute.global.buildPage(RoutePath.SPLASH_PAGE, null),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute<Object>(builder: (BuildContext context) {
          return AppRoute.global.buildPage(settings.name, settings.arguments);
        });
      },
    );
  }
}
