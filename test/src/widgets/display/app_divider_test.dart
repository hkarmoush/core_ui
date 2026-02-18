import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:core_ui/core_ui.dart';

void main() {
  testWidgets('AppDivider renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: AppDivider())),
    );

    expect(find.byType(Divider), findsOneWidget);
  });
}
