import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../utils/app_constants/app_colors.dart';

class MyCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final Widget? placeholder;
  final Widget? errorWidget;
  final double? height, width;
  final Alignment alignment;
  final BoxFit? fit;
  final Widget Function(BuildContext, ImageProvider)? imageBuilder;

  const MyCachedNetworkImage(
      {Key? key,
      required this.imageUrl,
      this.placeholder,
      this.errorWidget,
      this.height,
      this.width,
      this.fit,
      this.alignment = Alignment.center,
      this.imageBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height ?? 40,
      width: width ?? 40,
      alignment: alignment,
      fit: fit ?? BoxFit.contain,
      imageUrl: imageUrl,
      imageBuilder: imageBuilder,
      placeholder: (context, url) => Center(
        child: placeholder ??
            const CircularProgressIndicator(color: AppColors.primary),
      ),
      errorWidget: (context, url, error) =>
          errorWidget ?? const Icon(Icons.error),
    );
  }
}
