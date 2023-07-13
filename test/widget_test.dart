// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:yumemi_coding_test/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // // Build our app and trigger a frame.
    // await tester.pumpWidget(const MyApp());

    // // Verify that our counter starts at 0.
    // expect(find.text('0'), findsOneWidget);
    // expect(find.text('1'), findsNothing);

  testWidgets('TextFieldが空の時にバリデーションがかかるか', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: GitHubRepositorySearchApp(),
      ),
    );

    await tester.tap(find.text('Search'));
    await tester.pump();

    // expect(find.text('0'), findsNothing);
    expect(find.text('Please enter some text'), findsOneWidget);
  });
}
