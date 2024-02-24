import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sappay_recharge/utils/extensions/sized_box_extension.dart';
import '../../translations/locale_keys.g.dart';
import '../../utils/app_constants/app_colors.dart';
import '../../utils/app_theme/app_text_style.dart';
import 'app_buttons/app_elevated_button.dart';
import 'text_view.dart';

class ConfirmPurchaseDialog extends StatelessWidget {
  final String title, description;
  final void Function()? onConfirm, onCancel;

  const ConfirmPurchaseDialog(
      {Key? key,
      required this.title,
      required this.description,
      required this.onConfirm,
      required this.onCancel})
      : super(key: key);

  showConfirmDialog(BuildContext context) {
    showDialog<void>(
      useSafeArea: false,
      context: context,
      builder: (context) => ConfirmPurchaseDialog(
        title: title,
        description: description,
        onCancel: onCancel,
        onConfirm: onConfirm,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(16),
        child: Dialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          insetPadding: EdgeInsets.zero,
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: const ShapeDecoration(
              color: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            ),
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextView(
                  text: title,
                  style: AppTextStyle.bold16,
                  maxLine: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: TextView(
                    text: description,
                    style: AppTextStyle.regular16.copyWith(
                      color: AppColors.primary,
                    ),
                    maxLine: 10,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: AppElevatedButton(
                        title: LocaleKeys.close.tr(),
                        backgroundColor: AppColors.white,
                        textStyle: AppTextStyle.bold16,
                        surfaceTintColor: AppColors.white,
                        borderSide:
                            const BorderSide(color: AppColors.lightGrey),
                        elevation: 0.0,
                        onPressed: onCancel,
                      ),
                    ),
                    15.0.horizontalSpace,
                    Expanded(
                      child: AppElevatedButton(
                        title: LocaleKeys.confirm.tr(),
                        backgroundColor: AppColors.primary,
                        textStyle: AppTextStyle.bold16
                            .copyWith(color: AppColors.white),
                        surfaceTintColor: AppColors.white,
                        elevation: 0.0,
                        onPressed: onConfirm,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
