import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:core_ui/core_ui.dart';

void main() {
  testWidgets('AppListTile renders title, subtitle, leading, trailing', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AppListTile(
            title: Text('Title'),
            subtitle: Text('Subtitle'),
            leading: Icon(Icons.home),
            trailing: Icon(Icons.arrow_forward),
          ),
        ),
      ),
    );

    expect(find.text('Title'), findsOneWidget);
    expect(find.text('Subtitle'), findsOneWidget);
    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
  });

  testWidgets('AppListTile handles tap', (WidgetTester tester) async {
    bool tapped = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppListTile(
            title: const Text('Title'),
            onTap: () => tapped = true,
          ),
        ),
      ),
    );

    await tester.tap(find.byType(AppListTile));
    expect(tapped, isTrue);
  });
}
