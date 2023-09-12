import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:morse_code_learning/core/app_theme.dart';

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({
    super.key,
    this.backgroundColor = AppTheme.primaryWhite,
    this.icon,
    this.iconSize = 24,
    this.svgPath,
    this.iconColor = AppTheme.primaryDark,
  });

  final height = 65.0;
  final width = 65.0;
  final double iconSize;
  final Color backgroundColor;
  final IconData? icon;
  final String? svgPath;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 65,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: svgPath != null
          ? SvgPicture.asset(
              svgPath!,
              colorFilter: ColorFilter.mode(
                iconColor,
                BlendMode.srcIn,
              ),
              fit: BoxFit.scaleDown,
            )
          : Icon(
              icon,
              color: iconColor,
              size: iconSize,
            ),
    );
  }
}
