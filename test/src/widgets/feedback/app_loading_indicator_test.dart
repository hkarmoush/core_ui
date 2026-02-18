import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/foundation.dart';

void main() {
  testWidgets(
    'AppLoadingIndicator renders CircularProgressIndicator on Android',
    (WidgetTester tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: AppLoadingIndicator())),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(CupertinoActivityIndicator), findsNothing);
      debugDefaultTargetPlatformOverride = null;
    },
  );

  testWidgets('AppLoadingIndicator renders CupertinoActivityIndicator on iOS', (
    WidgetTester tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: AppLoadingIndicator())),
    );

    expect(find.byType(CupertinoActivityIndicator), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsNothing);
    debugDefaultTargetPlatformOverride = null;
  });
}
