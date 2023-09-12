import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morse_code_learning/core/app_theme.dart';
import 'package:morse_code_learning/data/data.dart';

import '../../providers/bloc/landing_pageview_bloc.dart';

class SelectorWidget extends StatelessWidget {
  const SelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final currentPage = context.watch<LandingPageViewBloc>().state;
    return Row(
      children: [
        for (int i = 0; i < detailBlockTexts.length; i++)
          Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                height: 6,
                width: currentPage == i ? 56 : 20,
                decoration: BoxDecoration(
                  color: currentPage == i
                      ? AppTheme.primaryWhite
                      : AppTheme.primaryWhite.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(width: 5),
            ],
          ),
      ],
    );
  }
}
