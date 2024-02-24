import 'package:flutter/material.dart';
import 'package:sappay_recharge/utils/app_theme/app_text_style.dart';

class TextAlertDialog extends StatelessWidget {
  final String message;
  final Function onPressed;

  const TextAlertDialog({
    super.key,
    required this.message,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Text(
          message,
          style: AppTextStyle.medium14,
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(false),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onPressed();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
