import 'package:flutter/material.dart';
import 'package:sappay_recharge/utils/extensions/sized_box_extension.dart';

import '../../utils/app_constants/app_colors.dart';
import '../../utils/app_theme/app_text_style.dart';
import 'text_view.dart';

class CheckBoxCustom extends StatelessWidget {
  final bool? isSelected;
  final String? text;
  final ValueChanged value;
  final TextStyle? textStyle;
  final bool isDecoration;

  const CheckBoxCustom({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.value,
    this.textStyle,
    this.isDecoration = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      decoration: isDecoration
          ? ShapeDecoration(
              color: isSelected!
                  ? AppColors.primary.withOpacity(0.05)
                  : AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(
                  color: isSelected!
                      ? AppColors.transparent
                      : AppColors.lightGrey2,
                ),
              ),
            )
          : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            visualDensity: VisualDensity.compact,
            value: isSelected,
            onChanged: value,
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: TextView(
              text: text!,
              style: textStyle ?? AppTextStyle.semiBold13,
              maxLine: 2,
            ),
          ),
          10.0.horizontalSpace,
        ],
      ),
    );
  }
}
