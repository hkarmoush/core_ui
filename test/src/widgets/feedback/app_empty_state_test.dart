import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:core_ui/core_ui.dart';

void main() {
  testWidgets('AppEmptyState renders title, message, and action', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppEmptyState(
            title: 'No Data',
            message: 'Please try again.',
            action: ElevatedButton(
              onPressed: () {},
              child: const Text('Retry'),
            ),
          ),
        ),
      ),
    );

    expect(find.text('No Data'), findsOneWidget);
    expect(find.text('Please try again.'), findsOneWidget);
    expect(find.text('Retry'), findsOneWidget);
  });
}
