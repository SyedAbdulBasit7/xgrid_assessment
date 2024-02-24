import 'package:flutter/material.dart';
import 'package:sappay_recharge/utils/app_constants/app_images.dart';
import 'package:sappay_recharge/utils/extensions/sized_box_extension.dart';

import '../../utils/app_constants/app_colors.dart';
import '../../utils/app_theme/app_text_style.dart';
import 'app_buttons/app_elevated_button.dart';
import 'text_view.dart';

class ErrorDialog extends StatelessWidget {
  final String title, subTitle;
  final void Function()? onPressed;
  final bool isPop;

  const ErrorDialog(
      {Key? key,
      required this.title,
      this.subTitle = '',
      this.isPop = true,
      required this.onPressed})
      : super(key: key);

  showErrorDialog(BuildContext context) {
    showDialog<void>(
      useSafeArea: false,
      context: context,
      barrierDismissible: false,
      builder: (context) => ErrorDialog(
        title: title,
        onPressed: onPressed,
        subTitle: subTitle,
        isPop: isPop,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => isPop,
      child: SafeArea(
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
                  Image.asset(AppImages.errorIcon, height: 50, width: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      children: [
                        TextView(
                          text: title,
                          style: AppTextStyle.bold16,
                        ),
                        if (subTitle.isNotEmpty) ...[
                          15.0.verticalSpace,
                          TextView(
                            text: subTitle,
                            style: AppTextStyle.medium12,
                          ),
                        ]
                      ],
                    ),
                  ),
                  AppElevatedButton(
                    width: 190,
                    title: "Close",
                    backgroundColor: AppColors.white,
                    textStyle: AppTextStyle.bold16,
                    surfaceTintColor: AppColors.white,
                    borderSide: const BorderSide(color: AppColors.lightGrey),
                    elevation: 0.0,
                    onPressed: onPressed,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
