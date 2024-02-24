import 'package:flutter/cupertino.dart';

import '../app_constants/app_colors.dart';

class DecorationCustom {
  static ShapeDecoration shadowCard() {
    return ShapeDecoration(
      shadows: const [
        BoxShadow(
          color: AppColors.cardShadowColor,
          blurRadius: 30,
          offset: Offset(5, 5),
          spreadRadius: 0,
        )
      ],
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 0.50, color: AppColors.cardBorderColor),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  static ShapeDecoration card() {
    return ShapeDecoration(
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 0.50, color: AppColors.cardBorderColor),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  static ShapeDecoration specialCard() {
    return ShapeDecoration(
      color: AppColors.cardGrey,
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: AppColors.cardBorderColor),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
