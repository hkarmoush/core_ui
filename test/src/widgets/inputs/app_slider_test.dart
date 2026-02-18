import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/foundation.dart';

void main() {
  testWidgets('AppSlider renders correctly', (WidgetTester tester) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    double value = 0.5;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppSlider(value: value, onChanged: (v) => value = v),
        ),
      ),
    );

    expect(find.byType(Slider), findsOneWidget);
    debugDefaultTargetPlatformOverride = null;
  });
}
