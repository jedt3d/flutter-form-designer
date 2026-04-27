import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_form_designer_web/main.dart';

void main() {
  testWidgets('language segmented buttons are shown and default is English', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Thai'), findsOneWidget);
    expect(find.text('English'), findsOneWidget);
    expect(find.text('Japanese'), findsOneWidget);
    expect(find.text('Welcome'), findsOneWidget);
  });

  testWidgets('switch to Japanese updates the screen text', (tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Japanese'));
    await tester.pumpAndSettle();

    expect(find.text('ようこそ'), findsOneWidget);
  });
}
