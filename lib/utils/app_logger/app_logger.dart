import 'package:flutter/foundation.dart';

class AppLogger {
  static log(String? message) {
    if (kDebugMode) {
      print(message);
    }
  }
}
