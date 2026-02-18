import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/foundation.dart';

void main() {
  testWidgets('AppRadio renders correctly and handles selection', (
    WidgetTester tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    int? groupValue = 1;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              AppRadio<int>(
                value: 1,
                groupValue: groupValue,
                onChanged: (v) => groupValue = v,
              ),
              AppRadio<int>(
                value: 2,
                groupValue: groupValue,
                onChanged: (v) => groupValue = v,
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.byType(Radio<int>), findsNWidgets(2));

    // Tap the second radio
    await tester.tap(find.byType(Radio<int>).last);
    expect(groupValue, 2);
    debugDefaultTargetPlatformOverride = null;
  });
}
