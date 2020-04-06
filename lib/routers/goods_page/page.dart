import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class GoodsPage extends Page<GoodsState, Map<String, dynamic>> {
  GoodsPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<GoodsState>(
                adapter: null,
                slots: <String, Dependent<GoodsState>>{
                }),
            middleware: <Middleware<GoodsState>>[
            ],);

}
