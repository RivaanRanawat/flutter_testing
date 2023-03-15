import 'package:counter_app/counter.dart';
import 'package:counter_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'given counter is 0 when increment button is clicked then counter should be 1',
    (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MyHomePage(
            title: 'Counter App',
          ),
        ),
      );

      final ctr = find.text('0');
      expect(ctr, findsOneWidget);

      final ctr2 = find.text('1');
      expect(ctr2, findsNothing);

      final incrementBtn = find.byKey(const Key('increment_counter'));
      await tester.tap(incrementBtn);

      await tester.pump();

      final ctr3 = find.text('1');
      expect(ctr3, findsOneWidget);

      final ctr4 = find.text('0');
      expect(ctr4, findsNothing);

      expect(find.byType(AppBar), findsOneWidget);
    },
  );
}
