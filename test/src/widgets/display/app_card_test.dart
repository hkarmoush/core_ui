import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:core_ui/core_ui.dart';

void main() {
  testWidgets('AppCard renders child and handles tap', (
    WidgetTester tester,
  ) async {
    bool tapped = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppCard(
            onTap: () => tapped = true,
            child: const Text('Card Content'),
          ),
        ),
      ),
    );

    expect(find.text('Card Content'), findsOneWidget);
    expect(find.byType(Card), findsOneWidget);

    await tester.tap(find.byType(AppCard));
    await tester.pump();
    expect(tapped, isTrue);
  });
}
