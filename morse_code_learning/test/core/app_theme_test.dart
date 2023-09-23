import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:morse_code_learning/core/app_theme.dart';

void main() {
  group('App Theme tests', () {
    test('primaryDark should be correct', () {
      const primaryDark = AppTheme.primaryDark;
      expect(primaryDark, const Color(0xFF191919));
    });

    test('primaryBrown should be correct', () {
      const primaryBrown = AppTheme.primaryBrown;
      expect(primaryBrown, const Color(0xFFA67B5B));
    });

    test('primaryWhite should be correct', () {
      const primaryWhite = AppTheme.primaryWhite;
      expect(primaryWhite, const Color(0xFFFFFFFF));
    });

    test('secondaryWhite should be correct', () {
      const secondaryWhite = AppTheme.secondaryWhite;
      expect(secondaryWhite, const Color(0x7EFFFFFF));
    });

    test('secondaryDark should be correct', () {
      const secondaryDark = AppTheme.secondaryDark;
      expect(secondaryDark, const Color(0x99191919));
    });
  });
}
