import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppColors {
  static Color transparent = Colors.transparent;
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFFD9D9D9);
  static const Color primary = Color(0xFFD61F1F);
  static const Color shadowRed = Color(0x33D61F1F);
  static const Color red = Color(0xFFFF0000);
  static const Color lightRed = Color(0xFFFFEBEB);
  static const Color borderGray = Color(0xFFE8E8E8);
  static const Color shadowGray = Color(0x339E9E9E);
  static const Color hintColor = Color(0xFF7A7C8B);
  static const Color textFormField = Color(0xFFECEEF1);
  static const Color btnGrey = Color(0xFF858585);
  static const Color outlineBtn = Color(0xFF9E9E9E);
  static const Color creme = Color(0xFFF6F3F3);
  static const Color lightGrey = Color(0xFFDEDEDE);
  static const Color lightGrey1 = Color(0xFF79767D);
  static const Color lightGrey2 = Color(0xFFE0E0E0);
  static const Color lightGrey3 = Color(0xFFC2C2C2);
  static const Color cardGrey = Color(0xFFF9F9F9);
  static const Color greyText = Color(0x73FFFFFF);
  static const Color green = Color(0xFF01B41F);

  static const Color cardBorderColor = Color(0xFFECE6F0);
  static const Color cardShadowColor = Color(0x26000000);

  static const navigatorBarTheme = SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
      statusBarColor: AppColors.primary);
}
