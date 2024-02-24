import 'package:flutter/material.dart';
import '../app_constants/app_colors.dart';
import 'app_text_style.dart';

final appLightThemeData = ThemeData(
  useMaterial3: true,
  fontFamily: 'Gilroy-Regular',
  textTheme: const AppTextStyle(),
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: AppColors.navigatorBarTheme,
    backgroundColor: AppColors.primary,
    iconTheme: IconThemeData(color: AppColors.white),
    centerTitle: false,
    titleTextStyle: TextStyle(
      fontFamily: 'Gilroy-Regular',
      color: AppColors.white,
      fontSize: 25,
      fontWeight: FontWeight.bold,
      letterSpacing: 1,
    ),
  ),
  // elevatedButtonTheme: ElevatedButtonThemeData(
  //   style: ButtonStyle(
  //     textStyle: MaterialStateProperty.all(
  //       const TextStyle(
  //         color: AppColors.white,
  //       ),
  //     ),
  //     // backgroundColor: MaterialStateProperty.all(AppColors.primary),
  //   ),
  // ),
);

final appDarkThemeData = ThemeData(
  useMaterial3: true,
  textTheme: const AppTextStyle(),
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
);
