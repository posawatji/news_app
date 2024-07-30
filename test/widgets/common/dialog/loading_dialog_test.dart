import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/widgets/common/dialog/loading_dialog.dart';

void main() {
  testWidgets('LoadingDialog shows and closes correctly', (WidgetTester tester) async {
    // Define a simple widget to trigger the LoadingDialog
    final testWidget = MaterialApp(
      home: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            body: Center(
              child: ElevatedButton(
                onPressed: () {
                  LoadingDialog.show(context);
                },
                child: const Text('Show LoadingDialog'),
              ),
            ),
          );
        },
      ),
    );

    // Build the test widget
    await tester.pumpWidget(testWidget);

    // Verify the LoadingDialog is not present initially
    expect(find.byKey(LoadingDialog.keys.loading_dialog), findsNothing);

    // Tap the button to show the LoadingDialog
    await tester.tap(find.text('Show LoadingDialog'));
    await tester.pump(); // Start the showDialog animation
    await tester.pump(const Duration(milliseconds: 200)); // Finish the showDialog animation

    // Verify the LoadingDialog is displayed
    expect(find.byKey(LoadingDialog.keys.loading_dialog), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Close the LoadingDialog
    LoadingDialog.close(tester.element(find.byType(AlertDialog)));
    await tester.pumpAndSettle(); // Wait for the dialog to close

    // Verify the LoadingDialog is closed
    expect(find.byKey(LoadingDialog.keys.loading_dialog), findsNothing);
  });
}
