import 'package:flutter/cupertino.dart';

import '../services/connectivity_service.dart';
import '../services/dependency_injection.dart';

enum NotifierState { initial, loading, loaded, error }

class BaseViewModel with ChangeNotifier {
  final connectivityService = getIt.get<ConnectivityService>();

  Future<void> checkConnectivity() async {
    await connectivityService.initConnectivity();
  }

  NotifierState _state = NotifierState.initial;

  NotifierState get state => _state;

  NotifierState _state1 = NotifierState.initial;

  NotifierState get state1 => _state1;

  NotifierState _state2 = NotifierState.initial;

  NotifierState get state2 => _state2;

  NotifierState _state3 = NotifierState.initial;

  NotifierState get state3 => _state3;

  NotifierState _state4 = NotifierState.initial;

  NotifierState get state4 => _state4;

  NotifierState _state5 = NotifierState.initial;

  NotifierState get state5 => _state5;

  void dispatch(NotifierState state) {
    _state = state;
    notifyListeners();
  }

  void dispatch1(NotifierState state) {
    _state1 = state;
    notifyListeners();
  }

  void dispatch2(NotifierState state) {
    _state2 = state;
    notifyListeners();
  }

  void dispatch3(NotifierState state) {
    _state3 = state;
    notifyListeners();
  }

  void dispatch4(NotifierState state) {
    _state4 = state;
    notifyListeners();
  }

  void dispatch5(NotifierState state) {
    _state5 = state;
    notifyListeners();
  }
}
