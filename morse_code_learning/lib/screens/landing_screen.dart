import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morse_code_learning/core/app_strings.dart';
import 'package:morse_code_learning/core/sizes.dart';
import 'package:morse_code_learning/core/widgets/custom_slider.dart';
import 'package:morse_code_learning/core/widgets/detail_block_widget.dart';
import 'package:morse_code_learning/core/widgets/selector_widget.dart';
import 'package:morse_code_learning/core/widgets/title_widget.dart';
import 'package:morse_code_learning/data/data.dart';
import 'package:morse_code_learning/screens/home_screen.dart';

import '../providers/bloc/landing_pageview_bloc.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  static const String route = AppStrings.landingScreenRoute;

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    // * Initializing PageController with initial page set to the current page:
    _pageController = PageController(
      initialPage: context.read<LandingPageViewBloc>().state,
      viewportFraction: 1,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (value) {
              // * Updating current page:
              context
                  .read<LandingPageViewBloc>()
                  .add(UpdatePageViewIndex(value));
            },
            // * Disabling swipe beyond extents:
            physics: const ClampingScrollPhysics(),

            itemCount: detailBlockTexts.length,
            itemBuilder: (context, index) {
              return Stack(children: [
                // * Background image:
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(detailBlockTexts[index].image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  // * Giving full screen size to the background image:
                  width: Sizes.getWidth(context),
                  height: Sizes.getHeight(context),
                  // * Adding blur effect to the background image, to make the text legible:
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                    child: Container(
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
                ),
                // * Gradient on top of the background image:
                // Container(
                //   decoration: const BoxDecoration(
                //     gradient: LinearGradient(
                //       colors: [Colors.transparent, Colors.black],
                //       begin: Alignment.bottomCenter,
                //       end: Alignment.topCenter,
                //       stops: [1, 1],
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.normalPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(flex: 18),
                      DetailBlockWidget(
                        detailText: detailBlockTexts[index].detailText,
                        detailDescription:
                            detailBlockTexts[index].detailDescription,
                      ),
                      const Spacer(flex: 7),
                    ],
                  ),
                ),
              ]);
            },
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.normalPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // * App Title:
                  const TitleWidget(),
                  const Spacer(),
                  // * Swipe indicator:
                  const SelectorWidget(),
                  SizedBox(height: Sizes.getHeight(context) * 0.07),
                  // * Start Slider:
                  CustomSlider(
                    text: AppStrings.homeSlider,
                    // * Showing the arrow animation at the end of the slider:
                    hasArrowAnimation: true,
                    // * Navigating to HomeScreen when swiped:
                    onDragCompleted: () {
                      Navigator.of(context).pushNamed(HomeScreen.route);
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
