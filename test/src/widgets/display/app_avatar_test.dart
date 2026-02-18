import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:core_ui/core_ui.dart';

void main() {
  testWidgets('AppAvatar renders initials when no image provided', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: AppAvatar(initials: 'JD')),
      ),
    );

    expect(find.text('JD'), findsOneWidget);
    // Finds the container with the background color
    expect(find.byType(Container), findsOneWidget);
  });

  // Note: Testing network images usually requires mocking or using a specific package to override HTTP clients.
  // For basic widget testing without extra dependencies, we'll focus on the fallback logic.
}
