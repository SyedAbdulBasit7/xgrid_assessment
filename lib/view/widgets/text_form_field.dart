import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/app_constants/app_colors.dart';
import '../../utils/app_theme/app_text_style.dart';

class AppTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLength;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final FocusNode? focusNode;
  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter>? textInputFormater;
  final bool? obscure;
  final bool readOnly;
  final Color filledColor;
  final BoxConstraints? suffixIconConstraints;

  const AppTextFormField({
    Key? key,
    this.controller,
    this.hintText = '',
    this.prefixIcon,
    this.maxLength,
    this.keyboardType,
    this.onChanged,
    this.validator,
    this.focusNode,
    this.textInputAction = TextInputAction.next,
    this.onFieldSubmitted,
    this.textCapitalization,
    this.textInputFormater,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.obscure = false,
    this.readOnly = false,
    this.filledColor = AppColors.textFormField,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: TextFormField(
        readOnly: readOnly,
        obscureText: obscure!,
        onFieldSubmitted: onFieldSubmitted,
        textAlignVertical: TextAlignVertical.center,
        textInputAction: textInputAction,
        onChanged: onChanged,
        keyboardType: keyboardType,
        maxLength: maxLength,
        controller: controller,
        style: AppTextStyle.medium16,
        focusNode: focusNode ?? FocusNode(),
        decoration: InputDecoration(
          filled: false,
          fillColor: filledColor,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          suffixIconConstraints: suffixIconConstraints,
          errorStyle: AppTextStyle.regular12.copyWith(color: Colors.red),
          hintText: hintText,
          hintStyle: AppTextStyle.regular16.copyWith(
            color: AppColors.black.withOpacity(0.20),
          ),
          contentPadding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.black.withOpacity(0.20),
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.black.withOpacity(0.20),
            ),
          ),
        ),
        validator: validator,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        inputFormatters: textInputFormater ??
            [FilteringTextInputFormatter.singleLineFormatter],
      ),
    );
  }
}
