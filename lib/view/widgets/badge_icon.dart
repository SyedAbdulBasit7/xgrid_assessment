import 'package:flutter/material.dart';
import 'package:sappay_recharge/utils/app_theme/app_text_style.dart';
import 'package:sappay_recharge/view/widgets/text_view.dart';

import '../../utils/app_constants/app_colors.dart';

class BadgeIcon extends StatelessWidget {
  final Widget? icon;
  final String counter;
  final bool isShow;

  const BadgeIcon(
      {Key? key,
      required this.icon,
      required this.counter,
      this.isShow = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        icon!,
        isShow
            ? Positioned(
                right: 4,
                top: 6,
                child: Container(
                  padding: EdgeInsets.all(int.parse(counter) >= 9 ? 1 : 3),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.primary, width: 2)),
                  constraints: const BoxConstraints(
                    minWidth: 9,
                    minHeight: 9,
                  ),
                  child: TextView(
                    text: counter,
                    style:
                        AppTextStyle.bold10.copyWith(color: AppColors.primary),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
