import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/foundation.dart';

void main() {
  testWidgets('AppDialog component renders correctly on Android context', (
    WidgetTester tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AppDialog(title: 'Alert', content: 'Message', actions: []),
        ),
      ),
    );

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Alert'), findsOneWidget);
    debugDefaultTargetPlatformOverride = null;
  });

  testWidgets('AppDialog component renders correctly on iOS context', (
    WidgetTester tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AppDialog(title: 'Alert', content: 'Message', actions: []),
        ),
      ),
    );

    expect(find.byType(CupertinoAlertDialog), findsOneWidget);
    expect(find.text('Alert'), findsOneWidget);
    debugDefaultTargetPlatformOverride = null;
  });
}
