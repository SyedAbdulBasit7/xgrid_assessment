import 'package:flutter/material.dart';

import '../../../utils/app_theme/app_text_style.dart';
import '../text_view.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton(
      {Key? key,
      required this.title,
      this.onPressed,
      this.textAlignment = TextAlign.center,
      this.isUpperCase = true,
      this.style})
      : super(key: key);

  final String title;
  final VoidCallback? onPressed;
  final bool isUpperCase;
  final TextAlign textAlignment;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: TextView(
        text: isUpperCase ? title.toUpperCase() : title,
        maxLine: 5,
        textAlign: textAlignment,
        style: style ?? AppTextStyle.regular16,
      ),
    );
  }
}
