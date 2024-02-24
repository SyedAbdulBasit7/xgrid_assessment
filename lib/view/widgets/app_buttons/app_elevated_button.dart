import 'package:ecommerce_app/utils/app_constants/app_colors.dart';
import 'package:ecommerce_app/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import '../text_view.dart';

class AppElevatedButton extends StatelessWidget {
  final String? title;
  final Widget? trailingIcon, leadingIcon;
  final VoidCallback? onPressed;
  final bool? isUpperCase, isTrailing, isLeading;
  final Color? backgroundColor, foregroundColor, surfaceTintColor;
  final TextStyle? textStyle;
  final double? elevation, borderRadius, height, width;
  final TextAlign textAlign;
  final EdgeInsetsGeometry? padding;
  final Size? minimumSize;
  final BorderSide? borderSide;

  const AppElevatedButton({
    Key? key,
    required this.title,
    this.onPressed,
    this.backgroundColor = AppColors.primary,
    this.foregroundColor,
    this.textStyle,
    this.isUpperCase = false,
    this.textAlign = TextAlign.center,
    this.isTrailing = false,
    this.borderRadius,
    this.trailingIcon,
    this.leadingIcon,
    this.isLeading,
    this.padding,
    this.minimumSize,
    this.elevation,
    this.height,
    this.surfaceTintColor,
    this.borderSide,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? context.width,
      height: height ?? 44,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          minimumSize: minimumSize,
          backgroundColor:
              onPressed == null ? AppColors.lightGrey3 : backgroundColor,
          foregroundColor: foregroundColor,
          padding: padding,
          surfaceTintColor: surfaceTintColor,
          side: borderSide,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 5.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isTrailing ?? false) trailingIcon!,
            FittedBox(
              child: TextView(
                textAlign: textAlign,
                text: isUpperCase! ? title!.toUpperCase() : title!,
                maxLine: 1,
                style: textStyle,
              ),
            ),
            if (isLeading ?? false) leadingIcon!,
          ],
        ),
      ),
    );
  }
}
