import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:core_ui/core_ui.dart';

void main() {
  testWidgets('AppErrorWidget renders message and handles retry', (
    WidgetTester tester,
  ) async {
    bool retried = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppErrorWidget(
            message: 'Something went wrong',
            onRetry: () => retried = true,
          ),
        ),
      ),
    );

    expect(find.text('Something went wrong'), findsOneWidget);
    expect(find.text('Retry'), findsOneWidget);

    await tester.tap(find.text('Retry'));
    expect(retried, isTrue);
  });
}
