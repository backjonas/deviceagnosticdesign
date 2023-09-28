import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../lib/screens/util/screen_wrapper.dart';

void main() {
  testWidgets("ScreenWrapper returns a Text widget with the text 'DAD Jokes'",
      (tester) async {
    await tester.pumpWidget(MaterialApp(
        home: ScreenWrapper(
      Icon(
        Icons.favorite,
        color: Colors.pink,
        size: 24.0,
        semanticLabel: 'Text to announce in accessibility modes',
      ),
    )));
    final textFinder = find.byType(Text);
    expect(textFinder, findsOneWidget);
    final dadFinder = find.text('DAD Jokes');
    expect(dadFinder, findsOneWidget);
  });
}
