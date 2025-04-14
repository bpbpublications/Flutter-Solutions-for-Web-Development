import 'package:dartbyte/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Test to check if the AppBar is displayed
  testWidgets('Display app bar', (WidgetTester tester) async {
    // Build the DartByte app
    await tester.pumpWidget(const DartByteApp());

    // Verify if AppBar is displayed
    expect(find.byType(AppBar), findsOneWidget);

    // Verify if the AppBar title text is 'DartByte'
    expect(find.text('DartByte'), findsOneWidget);
  });

  // Test to check if the theme toggle (light/dark mode) works
  testWidgets('Toggle light/dark theme', (WidgetTester tester) async {
    // Build the DartByte app
    await tester.pumpWidget(const DartByteApp());

    // Verify the MaterialApp and the default page are present
    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byType(ByteBoardPage), findsOneWidget);

    // Find the theme toggle button (icon) and tap it
    expect(find.byIcon(Icons.brightness_4), findsOneWidget);
    await tester.tap(find.byIcon(Icons.brightness_4));

    // Trigger a frame to reflect the UI change
    await tester.pump();

    // Verify the toggle button is still there after the theme change
    expect(find.byIcon(Icons.brightness_4), findsOneWidget);
  });
}
