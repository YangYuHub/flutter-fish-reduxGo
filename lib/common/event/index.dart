

import 'package:event_bus/event_bus.dart';

EventBus eventBus = new EventBus();


class GlobalColor {
  int colorIndex;

  GlobalColor(this.colorIndex);
}

class GlobalLanguage {
  String language;

  GlobalLanguage(this.language);
}
