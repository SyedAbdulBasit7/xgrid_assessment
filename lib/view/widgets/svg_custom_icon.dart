import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgCustomIcon extends StatelessWidget {
  final String? svgIcon;
  final ColorFilter? iconColor;
  final double? iconSize;
  final String? tooltipHint;
  final BoxFit svgBoxFit;
  final bool isNetwork;

  const SvgCustomIcon({
    Key? key,
    this.svgIcon,
    this.iconColor,
    this.iconSize,
    this.tooltipHint,
    this.svgBoxFit = BoxFit.cover,
    this.isNetwork = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isNetwork
        ? SvgPicture.network(
            svgIcon ?? '',
            colorFilter: iconColor,
            fit: svgBoxFit,
            width: iconSize,
            height: iconSize,
          )
        : SvgPicture.asset(
            svgIcon ?? '',
            colorFilter: iconColor,
            width: iconSize,
            height: iconSize,
            fit: svgBoxFit,
          );
  }
}
