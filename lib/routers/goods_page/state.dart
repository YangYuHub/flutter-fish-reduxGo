import 'package:fish_redux/fish_redux.dart';

class GoodsState implements Cloneable<GoodsState> {

  @override
  GoodsState clone() {
    return GoodsState();
  }
}

GoodsState initState(Map<String, dynamic> args) {
  return GoodsState();
}
