import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class WebButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
                child: ElevatedButton(
      onPressed: () {
        print('Button clicked!');
      },
      child: Text('Click Me'),
    ))));
  }
}

void main() {
  testWidgets('Button is clickable', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(WebButtonWidget());

    // Find the button by its text
    final buttonFinder = find.text('Click Me');

    // Verify the button is found
    expect(buttonFinder, findsOneWidget);

    // Tap the button
    await tester.tap(buttonFinder);

    // Rebuild the widget after the button is tapped
    await tester.pump();

    // Optionally check for any other effects of the button click
  });
}
