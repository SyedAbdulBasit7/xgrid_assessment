import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/dependency_injection.dart';
import '../view/screens/home/view_model/home_view_model.dart';

class ProviderList {
  initList() {
    return [withGetIt<HomeViewModel>(),];
  }

  ChangeNotifierProvider<T> withGetIt<T extends ChangeNotifier>() {
    return ChangeNotifierProvider<T>(create: (_) => getIt.get<T>());
  }

  ChangeNotifierProvider<T> withoutGetIt<T extends ChangeNotifier>(
      T Function() model) {
    return ChangeNotifierProvider<T>(create: (_) => model());
  }
}
