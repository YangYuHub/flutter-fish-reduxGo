import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum GoodsAction { action }

class GoodsActionCreator {
  static Action onAction() {
    return const Action(GoodsAction.action);
  }
}
