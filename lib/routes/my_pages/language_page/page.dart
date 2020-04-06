import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class LanguagePage extends Page<LanguageState, Map<String, dynamic>> {
  LanguagePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<LanguageState>(
                adapter: null,
                slots: <String, Dependent<LanguageState>>{
                }),
            middleware: <Middleware<LanguageState>>[
            ],);

}
