import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/widgets/common/button/to_button.dart';

void main() {
  testWidgets('ToButton test', (WidgetTester tester) async {
    // Define the toButtonKey.
    const toButtonKey = Key('to_button_key');
    bool wasPressed = false;

    // Build the widget.
    await tester.pumpWidget(
      CupertinoApp(
        home: ToButton(
          key: toButtonKey,
          onPressed: () {
            wasPressed = true;
          },
          borderRadius: BorderRadius.circular(8.0),
          color: CupertinoColors.activeBlue,
          child: const Text('Tap me'),
        ),
      ),
    );

    // Verify the button exists.
    expect(find.byKey(toButtonKey), findsOneWidget);

    // Verify the child widget.
    expect(find.text('Tap me'), findsOneWidget);

    // Tap the button.
    await tester.tap(find.byKey(toButtonKey));
    await tester.pump();

    // Verify the button was pressed.
    expect(wasPressed, isTrue);
  });
}
