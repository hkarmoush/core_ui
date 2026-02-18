import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:core_ui/core_ui.dart';

void main() {
  testWidgets('AppButton renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppButton(text: 'Test Button', onPressed: () {}),
        ),
      ),
    );

    expect(find.text('Test Button'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('AppButton shows loading indicator', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: AppButton(text: 'Loading', isLoading: true)),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
