import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../lib/screens/joke_screen.dart';

void main() {
  testWidgets("JokeScreen has button with text 'Back'.", (tester) async {
    await tester.pumpWidget(MaterialApp(home: JokeScreen()));
    final textButtonFinder = find.byType(TextButton);
    expect(textButtonFinder, findsOneWidget);
    final backFinder = find.text('Back');
    expect(backFinder, findsOneWidget);
  });

  testWidgets("JokeScreen contains four text widgets", (tester) async {
    await tester.pumpWidget(MaterialApp(home: JokeScreen()));
    final textWidgetFinder = find.byType(Text);
    expect(textWidgetFinder, findsNWidgets(4));
  });
}
