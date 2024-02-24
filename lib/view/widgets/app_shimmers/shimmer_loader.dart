import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/app_constants/app_colors.dart';

class ShimmerLoader extends StatelessWidget {
  final double? height, width, radius;

  const ShimmerLoader({Key? key, this.height, this.width, this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.textFormField,
      highlightColor: AppColors.white,
      child: Container(
        width: width ?? 100,
        height: height ?? 22,
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(radius ?? 5),
        ),
      ),
    );
  }
}
