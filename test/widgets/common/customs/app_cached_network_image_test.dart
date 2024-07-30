import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/widgets/common/customs/app_cached_network_image.dart';

void main() {
  testWidgets('AppCachedNetworkImage displays an image', (WidgetTester tester) async {
    const testImageUrl = 'https://example.com/image.jpg';

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AppCachedNetworkImage(imageUrl: testImageUrl),
        ),
      ),
    );

    // Check if CachedNetworkImage is used in the widget tree
    expect(find.byType(CachedNetworkImage), findsOneWidget);
  });
}
