import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../configs/env.dart';

final apiClientProvider = Provider.autoDispose<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: ENV.API_ENDPOINT,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      contentType: Headers.jsonContentType,
      headers: {
        'x-rapidapi-key': ENV.X_RAPIDAPI_KEY,
        'x-rapidapi-host': ENV.X_RAPIDAPI_HOST,
      },
    ),
  );

  return dio;
});
