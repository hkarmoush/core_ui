import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:core_ui/core_ui.dart';

void main() {
  testWidgets('AppChip renders label and handles tap', (
    WidgetTester tester,
  ) async {
    bool tapped = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppChip(label: 'Test Chip', onPressed: () => tapped = true),
        ),
      ),
    );

    expect(find.text('Test Chip'), findsOneWidget);
    await tester.tap(find.byType(AppChip));
    expect(tapped, isTrue);
  });

  testWidgets('AppChip renders avatar when provided', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AppChip(label: 'Test Chip', avatarIcon: Icons.person),
        ),
      ),
    );

    expect(find.byIcon(Icons.person), findsOneWidget);
  });
}
