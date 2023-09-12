import 'package:flutter/material.dart';
import 'package:morse_code_learning/core/app_theme.dart';

class TitleWidget extends StatefulWidget {
  const TitleWidget({super.key});

  @override
  State<TitleWidget> createState() => _TitleWidgetState();
}

class _TitleWidgetState extends State<TitleWidget> {
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'MORSE',
            style: AppTextStyles.getTextStyle(
              color: AppTheme.primaryWhite,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.15,
              ffStyle: "Medium",
            ),
          ),
          TextSpan(
            text: 'LAB',
            style: AppTextStyles.getTextStyle(
              color: AppTheme.primaryWhite,
              fontSize: 20,
              letterSpacing: 0.15,
              ffStyle: "Regular",
            ),
          ),
        ],
      ),
    );
  }
}
