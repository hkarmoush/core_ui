import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/foundation.dart';

void main() {
  testWidgets('AppSwitch renders Material switch on Android', (
    WidgetTester tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    bool value = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppSwitch(value: value, onChanged: (v) => value = v),
        ),
      ),
    );

    expect(find.byType(Switch), findsOneWidget);
    expect(find.byType(CupertinoSwitch), findsNothing);

    await tester.tap(find.byType(Switch));
    expect(value, isTrue);
    debugDefaultTargetPlatformOverride = null;
  });

  testWidgets('AppSwitch renders Cupertino switch on iOS', (
    WidgetTester tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    bool value = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppSwitch(value: value, onChanged: (v) => value = v),
        ),
      ),
    );

    expect(find.byType(CupertinoSwitch), findsOneWidget);
    expect(find.byType(Switch), findsNothing);

    await tester.tap(find.byType(CupertinoSwitch));
    expect(value, isTrue);
    debugDefaultTargetPlatformOverride = null;
  });
}
