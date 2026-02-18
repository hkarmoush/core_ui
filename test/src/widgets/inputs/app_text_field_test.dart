import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:core_ui/core_ui.dart';

void main() {
  testWidgets('AppTextField renders label, hint, and handles input', (
    WidgetTester tester,
  ) async {
    final controller = TextEditingController();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppTextField(
            label: 'Username',
            hint: 'Enter username',
            controller: controller,
          ),
        ),
      ),
    );

    expect(find.text('Username'), findsOneWidget);
    expect(find.text('Enter username'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'JohnDoe');
    expect(controller.text, 'JohnDoe');
  });

  testWidgets('AppTextField shows error text', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AppTextField(label: 'Username', errorText: 'Invalid username'),
        ),
      ),
    );

    expect(find.text('Invalid username'), findsOneWidget);
  });
}
