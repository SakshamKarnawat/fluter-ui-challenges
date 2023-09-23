import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:morse_code_learning/core/sizes.dart';

void main() {
  group('Sizes tests - Unit', () {
    test('largePadding should be 30', () {
      const largePadding = Sizes.largePadding;
      expect(largePadding, 30);
    });

    test('normalPadding should be 20', () {
      const normalPadding = Sizes.normalPadding;
      expect(normalPadding, 20);
    });

    test('smallPadding should be 10', () {
      const smallPadding = Sizes.smallPadding;
      expect(smallPadding, 10);
    });

    test('extraSmallPadding should be 5', () {
      const extraSmallPadding = Sizes.extraSmallPadding;
      expect(extraSmallPadding, 5);
    });

    group('Sizes tests - Widget', () {
      testWidgets("getWidth should return screen width",
          (WidgetTester tester) async {
        // * Mocking the screen size:
        tester.view.physicalSize = const Size(1080, 1920);
        tester.view.devicePixelRatio = 1.0;

        const double expectedWidth = 1080;
        const double expectedHeight = 1920;

        await tester.pumpWidget(
          Builder(
            builder: (context) {
              final double actualWidth = Sizes.getWidth(context);
              final double actualHeight = Sizes.getHeight(context);
              expect(actualWidth, expectedWidth);
              expect(actualHeight, expectedHeight);

              return const Placeholder();
            },
          ),
        );
        // * Resetting the screen size:
        tester.view.reset();
      });
    });
  });
}
