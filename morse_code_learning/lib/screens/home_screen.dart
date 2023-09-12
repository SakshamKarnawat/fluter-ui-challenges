import 'package:flutter/material.dart';
import 'package:morse_code_learning/core/app_strings.dart';
import 'package:morse_code_learning/core/app_theme.dart';
import 'package:morse_code_learning/core/sizes.dart';
import 'package:morse_code_learning/core/widgets/bottom_navbar_widget.dart';
import 'package:morse_code_learning/core/widgets/custom_slider.dart';
import 'package:morse_code_learning/core/widgets/mini_row_card.dart';
import 'package:morse_code_learning/core/widgets/rounded_icon_button.dart';
import 'package:morse_code_learning/core/widgets/title_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String route = AppStrings.homeScreenRoute;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryDark,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.normalPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedIconButton(
                    svgPath: AppStrings.profile,
                    iconSize: 1,
                  ),
                  TitleWidget(),
                  RoundedIconButton(
                    backgroundColor: Color(0xff595959),
                    // icon: Icons.search_outlined,
                    iconColor: AppTheme.primaryWhite,
                    svgPath: AppStrings.search,
                    iconSize: 1,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                AppStrings.greetingText,
                style: AppTextStyles.getTextStyle(
                  color: AppTheme.primaryWhite,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  ffStyle: "Medium",
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image:
                                AssetImage("assets/images/background_one.jpg"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.largePadding,
                            vertical: Sizes.largePadding,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Progress",
                                    style: AppTextStyles.getTextStyle(
                                      color: AppTheme.primaryWhite,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      ffStyle: "Medium",
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "Level 12",
                                    style: AppTextStyles.getTextStyle(
                                      color: AppTheme.primaryWhite,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      ffStyle: "Medium",
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Text(
                                    "56%",
                                    style: AppTextStyles.getTextStyle(
                                      color: AppTheme.primaryWhite,
                                      fontSize: 48,
                                      fontWeight: FontWeight.bold,
                                      ffStyle: "SemiBold",
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "42%",
                                    style: AppTextStyles.getTextStyle(
                                      color: AppTheme.primaryWhite,
                                      fontSize: 48,
                                      fontWeight: FontWeight.bold,
                                      ffStyle: "SemiBold",
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              const CustomSlider(
                                text: "Continue",
                                sliderHeadBackgroundColor:
                                    AppTheme.primaryWhite,
                                sliderHeadIconColor: AppTheme.primaryDark,
                                sliderHeadIconSize: 14,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(
                      height: 150,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                            child: MiniRowCard(
                              title: "Popular\nphrases",
                              subtitle: "12 of 75 learned",
                              cardColor: AppTheme.primaryBrown,
                              icon: Icons.play_arrow_outlined,
                              iconColor: AppTheme.primaryWhite,
                              iconSize: 36,
                            ),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            child: MiniRowCard(
                              title: "Repeat\nlearned",
                              subtitle: "7 of 28 hours",
                              cardColor: Color(0xff373737),
                              icon: Icons.repeat_outlined,
                              iconSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const BottomNavbarWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
