import 'package:flutter/material.dart';

extension AppContext on BuildContext {
  //for routes
  pop<T>({T? result}) => Navigator.pop(this, result);

  pushNamed(String routeName, {Object? args}) =>
      Navigator.pushNamed(this, routeName, arguments: args);

  pushReplacementNamed(String routeName, {Object? args}) =>
      Navigator.pushReplacementNamed(this, routeName, arguments: args);

  pushNamedAndRemoveUntil(String routeName, {Object? args}) =>
      Navigator.pushNamedAndRemoveUntil(
        this,
        routeName,
        (Route route) => false,
        arguments: args,
      );

  // for media query
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get height => mediaQuery.size.height;

  double get width => mediaQuery.size.width;

  double heightValue(double value) => mediaQuery.size.height * value;

  double widthValue(double value) => mediaQuery.size.width * value;

  ColorScheme get getColor => Theme.of(this).colorScheme;
}
