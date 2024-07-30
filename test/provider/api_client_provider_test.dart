import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_app/configs/env.dart';
import 'package:news_app/provider/api_client_provider.dart';
// Import your file containing the apiClientProvider

// Mock ENV class
class MockENV extends Mock implements ENV {}

void main() {
  test('apiClientProvider creates Dio instance and return Dio', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final dio = container.read(apiClientProvider);

    expect(dio, isA<Dio>());
  });
}
