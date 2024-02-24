import 'package:ecommerce_app/utils/extensions/sized_box_extension.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_constants/app_colors.dart';
import '../../../utils/app_theme/app_text_style.dart';
import '../text_view.dart';

class NoDataAvailable extends StatelessWidget {
  const NoDataAvailable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextView(
              text: 'Coming Soon!',
              style: AppTextStyle.bold18.copyWith(color: AppColors.primary),
              maxLine: 10,
              textAlign: TextAlign.center,
            ),
            6.0.verticalSpace,
            TextView(
              text: 'No packages available right now.',
              style: AppTextStyle.regular16.copyWith(color: AppColors.primary),
              maxLine: 10,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
