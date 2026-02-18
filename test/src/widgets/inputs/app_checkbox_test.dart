import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/foundation.dart';

void main() {
  testWidgets('AppCheckbox renders Material checkbox on Android', (
    WidgetTester tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    bool? value = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppCheckbox(value: value, onChanged: (v) => value = v),
        ),
      ),
    );

    expect(find.byType(Checkbox), findsOneWidget);
    expect(find.byType(CupertinoCheckbox), findsNothing);

    await tester.tap(find.byType(Checkbox));
    expect(value, isTrue);
    debugDefaultTargetPlatformOverride = null;
  });

  testWidgets('AppCheckbox renders Cupertino checkbox on iOS', (
    WidgetTester tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    bool? value = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppCheckbox(value: value, onChanged: (v) => value = v),
        ),
      ),
    );

    expect(find.byType(CupertinoCheckbox), findsOneWidget);
    await tester.tap(find.byType(CupertinoCheckbox));
    expect(value, isTrue);
    debugDefaultTargetPlatformOverride = null;
  });
}
