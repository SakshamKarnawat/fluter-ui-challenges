import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:morse_code_learning/core/app_theme.dart';
import 'package:morse_code_learning/core/sizes.dart';
import 'package:morse_code_learning/providers/bloc/navbar_bloc.dart';

const navbarIconList = [
  "assets/icons/home.svg",
  "assets/icons/pie.svg",
  "assets/icons/article.svg",
  "assets/icons/heart.svg",
  "assets/icons/settings.svg",
];

class BottomNavbarWidget extends StatelessWidget {
  const BottomNavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final navbarPage = context.watch<NavbarBloc>().state;
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.primaryWhite.withOpacity(0.5),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: [
          // 5 icons here with a selected one:
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.extraSmallPadding / 2,
                vertical: Sizes.extraSmallPadding / 2,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (int i = 0; i < navbarIconList.length; i++)
                      (navbarPage == i)
                          ?
                          // wrap icon in a container to add a border:
                          Container(
                              height: 57.5,
                              width: 57.5,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppTheme.primaryWhite,
                              ),
                              child: Center(
                                child: IconButton(
                                  onPressed: () {
                                    context
                                        .read<NavbarBloc>()
                                        .add(UpdatePage(i));
                                  },
                                  icon: SvgPicture.asset(
                                    navbarIconList[i],
                                    colorFilter: ColorFilter.mode(
                                      navbarPage == i
                                          ? AppTheme.primaryDark
                                          : AppTheme.primaryWhite,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : IconButton(
                              onPressed: () {
                                context.read<NavbarBloc>().add(
                                      UpdatePage(i),
                                    );
                              },
                              icon: SvgPicture.asset(
                                navbarIconList[i],
                                colorFilter: ColorFilter.mode(
                                  navbarPage == i
                                      ? AppTheme.primaryDark
                                      : AppTheme.primaryWhite,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
