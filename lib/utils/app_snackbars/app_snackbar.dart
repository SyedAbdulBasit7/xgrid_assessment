import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import '../../view/widgets/text_view.dart';
import '../app_constants/app_colors.dart';
import '../app_theme/app_text_style.dart';

class FlushBarMessage {
  void errorFlushBar({
    String? errorMessage,
    required BuildContext context,
    duration = 5000,
    VoidCallback? onTap,
    String actionButtonText = 'title',
    bool viewActionButton = false,
    FlushbarPosition flushBarPosition = FlushbarPosition.BOTTOM,
  }) {
    Flushbar(
      flushbarPosition: flushBarPosition,
      messageText: SizedBox(
        height: 20,
        child: Row(
          children: [
            Expanded(
              child: FittedBox(
                alignment: Alignment.centerLeft,
                child: TextView(
                  text: "$errorMessage",
                  style: AppTextStyle.medium16.copyWith(color: AppColors.white),
                ),
              ),
            ),
            viewActionButton
                ? GestureDetector(
                    onTap: onTap,
                    child: SizedBox(
                      width: 100,
                      height: 40,
                      child: TextView(
                        text: actionButtonText,
                        style: AppTextStyle.regular16
                            .copyWith(color: AppColors.white),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
      backgroundColor: AppColors.black,
      duration: Duration(milliseconds: duration),
    ).show(context);
  }

  void successFlushBar({
    String? successMessage,
    required BuildContext context,
    int duration = 5000,
    FlushbarPosition flushBarPosition = FlushbarPosition.BOTTOM,
    Color bgColor = AppColors.primary,
  }) {
    Flushbar(
      flushbarPosition: flushBarPosition,
      messageText: SizedBox(
        height: 20,
        child: Row(
          children: [
            Expanded(
              child: FittedBox(
                alignment: Alignment.centerLeft,
                child: TextView(
                  text: "$successMessage",
                  style: AppTextStyle.medium16.copyWith(color: AppColors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: bgColor,
      duration: Duration(milliseconds: duration),
    ).show(context);
  }
}
