import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class TabNavigationPage extends Page<TabNavigationState, Map<String, dynamic>> {
  TabNavigationPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<TabNavigationState>(
                adapter: null,
                slots: <String, Dependent<TabNavigationState>>{
                }),
            middleware: <Middleware<TabNavigationState>>[
            ],);

}
