import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:core_ui/core_ui.dart';

void main() {
  testWidgets('AppBadge renders label and child', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AppBadge(label: '5', child: Icon(Icons.notifications)),
        ),
      ),
    );

    expect(find.byIcon(Icons.notifications), findsOneWidget);
    expect(find.text('5'), findsOneWidget);
  });

  testWidgets('AppBadge hides when show is false', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AppBadge(
            label: '5',
            show: false,
            child: Icon(Icons.notifications),
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.notifications), findsOneWidget);
    expect(find.text('5'), findsNothing);
  });
}
