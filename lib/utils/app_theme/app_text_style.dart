import 'package:flutter/material.dart';

import '../app_constants/app_colors.dart';

class AppTextStyle extends TextTheme {
  const AppTextStyle({
    TextStyle? displayLarge,
    TextStyle? displayMedium,
    TextStyle? displaySmall,
    TextStyle? headlineLarge,
    TextStyle? headlineMedium,
    TextStyle? headlineSmall,
    TextStyle? titleLarge,
    TextStyle? titleMedium,
    TextStyle? titleSmall,
    TextStyle? bodyLarge,
    TextStyle? bodyMedium,
    TextStyle? bodySmall,
    TextStyle? labelLarge,
    TextStyle? labelMedium,
    TextStyle? labelSmall,
  }) : super(
          displayLarge: displayLarge,
          displayMedium: displayMedium,
          displaySmall: displaySmall,
          headlineLarge: headlineLarge,
          headlineMedium: headlineMedium,
          headlineSmall: headlineSmall,
          titleLarge: titleLarge,
          titleMedium: titleMedium,
          titleSmall: titleSmall,
          bodyLarge: bodyLarge,
          bodyMedium: bodyMedium,
          bodySmall: bodySmall,
          labelLarge: labelLarge,
          labelMedium: labelMedium,
          labelSmall: labelSmall,
        );

  static const String fontFamily = 'Gilroy';
  static const String ffBold = 'Gilroy-Bold';
  static const String ffSemiBold = 'Gilroy-SemiBold';
  static const String ffMedium = 'Gilroy-Medium';
  static const String ffRegular = 'Gilroy-Regular';

  static const TextStyle textStyle = TextStyle(
    fontFamily: fontFamily,
    color: AppColors.black,
  );

  @override
  TextStyle? get headlineLarge =>
      textStyle.copyWith(fontWeight: FontWeight.w700);

  @override
  TextStyle? get headlineMedium =>
      textStyle.copyWith(fontWeight: FontWeight.w600);

  @override
  TextStyle? get headlineSmall =>
      textStyle.copyWith(fontWeight: FontWeight.w500);

  @override
  TextStyle? get titleLarge => textStyle.copyWith(fontWeight: FontWeight.w700);

  @override
  TextStyle? get titleMedium => textStyle.copyWith(fontWeight: FontWeight.w500);

  @override
  TextStyle? get titleSmall => textStyle.copyWith(fontWeight: FontWeight.w400);

  @override
  TextStyle? get labelLarge => textStyle.copyWith(fontWeight: FontWeight.w500);

  @override
  TextStyle? get labelMedium => textStyle.copyWith(fontWeight: FontWeight.w400);

  @override
  TextStyle? get labelSmall => textStyle.copyWith(fontWeight: FontWeight.w300);

  @override
  TextStyle? get bodyLarge => textStyle.copyWith(fontWeight: FontWeight.w500);

  @override
  TextStyle? get bodyMedium => textStyle.copyWith(fontWeight: FontWeight.w400);

  @override
  TextStyle? get bodySmall => textStyle.copyWith(fontWeight: FontWeight.w300);

  //---------------Bold---------------
  static TextStyle bold32 =
      textStyle.copyWith(fontFamily: ffBold, fontSize: 32);
  static TextStyle bold25 =
      textStyle.copyWith(fontFamily: ffBold, fontSize: 25);
  static TextStyle bold20 =
      textStyle.copyWith(fontFamily: ffBold, fontSize: 20);
  static TextStyle bold18 =
      textStyle.copyWith(fontFamily: ffBold, fontSize: 18);
  static TextStyle bold16 =
      textStyle.copyWith(fontFamily: ffBold, fontSize: 16);
  static TextStyle bold14 =
      textStyle.copyWith(fontFamily: ffBold, fontSize: 14);
  static TextStyle bold12 =
      textStyle.copyWith(fontFamily: ffBold, fontSize: 12);
  static TextStyle bold10 =
      textStyle.copyWith(fontFamily: ffBold, fontSize: 10);

  //---------------Semi-Bold---------------
  static TextStyle semiBold18 =
      textStyle.copyWith(fontFamily: ffSemiBold, fontSize: 18);
  static TextStyle semiBold16 =
      textStyle.copyWith(fontFamily: ffSemiBold, fontSize: 16);
  static TextStyle semiBold13 =
      textStyle.copyWith(fontFamily: ffSemiBold, fontSize: 13);

  //---------------Medium---------------
  static TextStyle medium22 =
      textStyle.copyWith(fontFamily: ffMedium, fontSize: 22);
  static TextStyle medium16 =
      textStyle.copyWith(fontFamily: ffMedium, fontSize: 16);
  static TextStyle medium14 =
      textStyle.copyWith(fontFamily: ffMedium, fontSize: 14);
  static TextStyle medium12 =
      textStyle.copyWith(fontFamily: ffMedium, fontSize: 12);
  static TextStyle medium13 =
      textStyle.copyWith(fontFamily: ffMedium, fontSize: 13);

  //---------------Regular---------------
  static TextStyle regular12 =
      textStyle.copyWith(fontFamily: ffRegular, fontSize: 12);

  static TextStyle regular14 =
      textStyle.copyWith(fontFamily: ffRegular, fontSize: 14);

  static TextStyle regular16 =
      textStyle.copyWith(fontFamily: ffRegular, fontSize: 16);
}
