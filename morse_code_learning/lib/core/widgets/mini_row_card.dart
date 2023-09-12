import 'package:flutter/material.dart';
import 'package:morse_code_learning/core/app_theme.dart';
import 'package:morse_code_learning/core/sizes.dart';
import 'package:morse_code_learning/core/widgets/rounded_icon_button.dart';

class MiniRowCard extends StatelessWidget {
  const MiniRowCard({
    super.key,
    required this.cardColor,
    this.textColor = AppTheme.primaryWhite,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.iconColor = AppTheme.primaryWhite,
    this.iconSize = 24,
    this.buttonColor = AppTheme.secondaryWhite,
  });

  final Color cardColor;
  final Color textColor;
  final String title;
  final String subtitle;

  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.smallPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    title,
                    style: AppTextStyles.getTextStyle(
                      color: textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      ffStyle: "SemiBold",
                    ),
                  ),
                ),
                RoundedIconButton(
                  icon: icon,
                  iconColor: iconColor,
                  iconSize: iconSize,
                  backgroundColor: buttonColor,
                ),
              ],
            ),
            Text(
              subtitle,
              style: AppTextStyles.getTextStyle(
                color: textColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                ffStyle: "Light",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
