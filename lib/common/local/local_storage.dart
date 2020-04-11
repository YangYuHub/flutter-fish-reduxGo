import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_deer/common/cache/sp_util.dart';
import 'package:flutter_deer/common/config/config.dart';
import 'package:flutter_deer/common/constants/unified_theme_styles.dart';
import 'package:flutter_deer/global_store/action.dart';
import 'package:flutter_deer/global_store/store.dart';
import 'package:flutter_deer/util/base_tools.dart';
import 'package:shared_preferences/shared_preferences.dart';

///SharedPreferences 本地存储
class LocalStorage {

  static save(String key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static get(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  static remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }


  ///检查主题是否持久化
  static Future checnLocalThemeResources() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SpUtil.getInstance();
    String _localThemeLocale =
    SpUtil.getString(Config.LOCAL_THEME_LOCALE_KEY);
    int _localThemeColor = SpUtil.getInt(Config.LOCAL_THEME_COLOR_KEY);

    if (!BaseTools.isEmpty(_localThemeLocale)) {
      println(_localThemeLocale+"aaaaaaaa----------aaaaaaaa");
      if(_localThemeLocale=="en"){
        UnifiedThemeStyles.themeLocale = Locale('en', 'US');
      }else{
        UnifiedThemeStyles.themeLocale = Locale('zh', 'CN');
      }
    }
    try {
      if (_localThemeColor != null) {
        GlobalStore.store.dispatch(GlobalActionCreator.changeThemeColor(_localThemeColor));
//        Color _color = UnifiedThemeStyles.themeColors[_localThemeColor];
//        if (!BaseTools.isEmpty(_localThemeColor)) {
//          UnifiedThemeStyles.themeColor = _color;
//        }
      }
    } catch (e) {}
  }

  ///持久化主题资源
  static void saveLocalThemeResources(var resources) async {
    await SpUtil.getInstance();
    if (resources != null) {
      if (resources is String) {
        SpUtil.putString(Config.LOCAL_THEME_LOCALE_KEY, resources);
      } else if (resources is int) {
        SpUtil.putInt(Config.LOCAL_THEME_COLOR_KEY, resources);
      }
    }
  }
}
