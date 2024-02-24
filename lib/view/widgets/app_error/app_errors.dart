import 'package:flutter/material.dart';

import '../../../utils/app_constants/app_colors.dart';
import '../../../utils/app_theme/app_text_style.dart';
import '../text_view.dart';

class AppErrors extends StatelessWidget {
  final String error;
  final Color? titleColor, errorColor;
  final bool isCenter;

  const AppErrors({
    Key? key,
    required this.error,
    this.titleColor,
    this.errorColor,
    this.isCenter = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isCenter
        ? Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextView(
                    text: 'ERROR',
                    style: AppTextStyle.bold18
                        .copyWith(color: titleColor ?? AppColors.primary),
                    maxLine: 10,
                    textAlign: TextAlign.center,
                  ),
                  TextView(
                    text: error,
                    style: AppTextStyle.regular16
                        .copyWith(color: errorColor ?? AppColors.primary),
                    maxLine: 10,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextView(
                  text: 'ERROR',
                  style: AppTextStyle.bold18
                      .copyWith(color: titleColor ?? AppColors.primary),
                  maxLine: 10,
                  textAlign: TextAlign.center,
                ),
                TextView(
                  text: error,
                  style: AppTextStyle.regular16
                      .copyWith(color: errorColor ?? AppColors.primary),
                  maxLine: 10,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
  }
}
