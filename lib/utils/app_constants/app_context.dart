import 'package:flutter/cupertino.dart';

class GlobalContext {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext? get currentContext => navigatorKey.currentContext;
  static NavigatorState? get currentState => navigatorKey.currentState;
}
