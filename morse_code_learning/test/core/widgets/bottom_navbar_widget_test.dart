import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:morse_code_learning/core/widgets/bottom_navbar_widget.dart';

import '../../providers/landing_pageview_test_bloc.dart';

class TestBlocMock extends Mock implements LandingPageViewTestBloc {}

void main() {
  testWidgets(
    'given bottom navbar is at index 0, when user taps on index 1, then bottom navbar is at index 1',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                BottomNavbarWidget(),
              ],
            ),
          ),
        ),
      );

      find.byWidget(SvgPicture.asset(navbarIconList[0]));
    },
  );
}
