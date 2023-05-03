// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_best_practices/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    test(
      'Build our app and trigger a frame.',
      () async {
        await tester.pumpWidget(const MyApp());
      },
    );
    test(
      'Verify that our counter starts at 0.',
      () {
        expect(find.text('0'), findsOneWidget);
        expect(find.text('1'), findsNothing);
      },
    );
    test('Find and tap FAB', () async {
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();
    });

    // Verify that our counter has incremented.
    test('Verify that our counter has incremented', () {
      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);
    });
  });
}
