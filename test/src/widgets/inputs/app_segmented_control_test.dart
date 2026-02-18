import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/foundation.dart';

void main() {
  testWidgets(
    'AppSegmentedControl renders correctly on Android (SegmentedButton)',
    (WidgetTester tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      int groupValue = 1;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppSegmentedControl<int>(
              groupValue: groupValue,
              onValueChanged: (v) => groupValue = v!,
              children: const {1: Text('One'), 2: Text('Two')},
            ),
          ),
        ),
      );

      expect(find.byType(SegmentedButton<int>), findsOneWidget);
      expect(find.text('One'), findsOneWidget);
      expect(find.text('Two'), findsOneWidget);

      await tester.tap(find.text('Two'));
      expect(groupValue, 2);
      debugDefaultTargetPlatformOverride = null;
    },
  );

  testWidgets('AppSegmentedControl renders correctly on iOS (Cupertino)', (
    WidgetTester tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    int groupValue = 1;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppSegmentedControl<int>(
            groupValue: groupValue,
            onValueChanged: (v) => groupValue = v!,
            children: const {1: Text('One'), 2: Text('Two')},
          ),
        ),
      ),
    );

    expect(find.byType(CupertinoSegmentedControl<int>), findsOneWidget);
    debugDefaultTargetPlatformOverride = null;
  });
}
