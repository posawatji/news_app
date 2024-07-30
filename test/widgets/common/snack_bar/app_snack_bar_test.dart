import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/widgets/common/snack_bar/app_snack_bar.dart';

void main() {
  // Test widget to use in widget tests
  Widget testApp = MaterialApp(
    home: Scaffold(
      body: Builder(
        builder: (context) {
          return ElevatedButton(
            onPressed: () {
              AppSnackBar.show(context, 'Test Message');
            },
            child: const Text('Show SnackBar'),
          );
        },
      ),
    ),
  );

  testWidgets('show displays a SnackBar with the correct message', (WidgetTester tester) async {
    await tester.pumpWidget(testApp);

    // Tap the button to show the SnackBar
    await tester.tap(find.text('Show SnackBar'));
    await tester.pumpAndSettle(); // Wait for the SnackBar to be displayed

    // Verify the SnackBar is shown with the correct message
    expect(find.text('Test Message'), findsOneWidget);
    expect(find.byType(SnackBar), findsOneWidget);
  });

  testWidgets('showNoConnection displays the correct SnackBar message', (WidgetTester tester) async {
    Widget testAppWithNoConnection = MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) {
            return ElevatedButton(
              onPressed: () {
                AppSnackBar.showNoConnection(context);
              },
              child: const Text('Show No Connection SnackBar'),
            );
          },
        ),
      ),
    );

    await tester.pumpWidget(testAppWithNoConnection);

    // Tap the button to show the SnackBar
    await tester.tap(find.text('Show No Connection SnackBar'));
    await tester.pumpAndSettle(); // Wait for the SnackBar to be displayed

    // Verify the SnackBar is shown with the correct message
    expect(find.text('No Internet Connection, Please Check Your Internet Connection.'), findsOneWidget);
    expect(find.byType(SnackBar), findsOneWidget);
  });

  testWidgets('showSavedOrUnsavedError displays the correct SnackBar message', (WidgetTester tester) async {
    Widget testAppWithError = MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) {
            return ElevatedButton(
              onPressed: () {
                AppSnackBar.showSavedOrUnsavedError(context);
              },
              child: const Text('Show Save/Unsaved Error SnackBar'),
            );
          },
        ),
      ),
    );

    await tester.pumpWidget(testAppWithError);

    // Tap the button to show the SnackBar
    await tester.tap(find.text('Show Save/Unsaved Error SnackBar'));
    await tester.pumpAndSettle(); // Wait for the SnackBar to be displayed

    // Verify the SnackBar is shown with the correct message
    expect(find.text("Something Wrong Can't Saved/Unsaved News This Time, Please Try Again!"), findsOneWidget);
    expect(find.byType(SnackBar), findsOneWidget);
  });

  testWidgets('showClearCacheError displays the correct SnackBar message', (WidgetTester tester) async {
    Widget testAppWithClearCacheError = MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) {
            return ElevatedButton(
              onPressed: () {
                AppSnackBar.showClearCacheError(context);
              },
              child: const Text('Show Clear Cache Error SnackBar'),
            );
          },
        ),
      ),
    );

    await tester.pumpWidget(testAppWithClearCacheError);

    // Tap the button to show the SnackBar
    await tester.tap(find.text('Show Clear Cache Error SnackBar'));
    await tester.pumpAndSettle(); // Wait for the SnackBar to be displayed

    // Verify the SnackBar is shown with the correct message
    expect(find.text("Something Wrong Can't Clear Cache, Please Try Again!"), findsOneWidget);
    expect(find.byType(SnackBar), findsOneWidget);
  });
}
