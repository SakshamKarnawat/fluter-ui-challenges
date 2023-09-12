import 'package:flutter/material.dart';
import 'package:morse_code_learning/core/app_theme.dart';

class DetailBlockWidget extends StatelessWidget {
  final String detailText;
  final String detailDescription;

  const DetailBlockWidget({
    super.key,
    required this.detailText,
    required this.detailDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          detailText,
          style: AppTextStyles.getTextStyle(
            color: AppTheme.primaryWhite,
            fontSize: 36,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
            wordSpacing: 1.5,
            ffStyle: "SemiBold",
          ),
        ),
        const SizedBox(height: 10),
        Text(
          detailDescription,
          style: AppTextStyles.getTextStyle(
            color: AppTheme.primaryWhite,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
            ffStyle: "Regular",
          ),
        ),
      ],
    );
  }
}
