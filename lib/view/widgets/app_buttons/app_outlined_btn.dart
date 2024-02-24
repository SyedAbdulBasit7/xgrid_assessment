import 'package:flutter/material.dart';

import '../../../utils/app_constants/app_colors.dart';
import '../../../utils/app_theme/app_text_style.dart';
import '../text_view.dart';

class AppOutlinedButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;
  final bool? isFittedBox, isUpperCase, isLeading, isTrailing;
  final Color? borderColor, loaderAnimationColor;
  final TextStyle? textStyle;
  final double? loaderPadding, borderRadius, elevation, padding;
  final TextAlign textAlign;
  final Widget? trailingIcon, leadingIcon;

  const AppOutlinedButton({
    Key? key,
    required this.title,
    this.onPressed,
    this.borderColor,
    this.loaderPadding = 8.0,
    this.textStyle,
    this.isFittedBox = true,
    this.isUpperCase = true,
    this.textAlign = TextAlign.center,
    this.loaderAnimationColor = AppColors.white,
    this.borderRadius = 16.0,
    this.elevation,
    this.padding,
    this.isTrailing,
    this.isLeading,
    this.trailingIcon,
    this.leadingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        side: BorderSide(color: borderColor ?? AppColors.outlineBtn),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
        elevation: elevation,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: padding ?? 10),
        child: isFittedBox!
            ? FittedBox(
                child: Row(
                  children: [
                    if (isTrailing ?? false) trailingIcon!,
                    TextView(
                        textAlign: textAlign,
                        text: isUpperCase! ? title!.toUpperCase() : title!,
                        maxLine: 1,
                        style: textStyle ?? AppTextStyle.regular16),
                    if (isLeading ?? false) leadingIcon!,
                  ],
                ),
              )
            : TextView(
                textAlign: textAlign,
                text: isUpperCase! ? title!.toUpperCase() : title!,
                maxLine: 1,
                style: textStyle ?? AppTextStyle.regular16,
              ),
      ),
    );
  }
}
