import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../configs/env.dart';
import '../enum/news_category.dart';
import '../helpers/storage.dart';
import '../mock/mock_get_news_by_caregory/mock_news_by_business.dart';
import '../mock/mock_get_news_by_caregory/mock_news_by_entertainment.dart';
import '../mock/mock_get_news_by_caregory/mock_news_by_health.dart';
import '../mock/mock_get_news_by_caregory/mock_news_by_lasted.dart';
import '../mock/mock_get_news_by_caregory/mock_news_by_science.dart';
import '../mock/mock_get_news_by_caregory/mock_news_by_sport.dart';
import '../mock/mock_get_news_by_caregory/mock_news_by_technology.dart';
import '../mock/mock_get_news_by_caregory/mock_news_by_world.dart';
import '../models/news_model/news_model.dart';
import '../provider/api_client_provider.dart';
import '../provider/is_device_not_connected_to_any_network_provider.dart';

final getNewsByCategoryProvider = FutureProvider.autoDispose.family<NewsModel, GetNewsByCategoryParam>((ref, param) async {
  final cancelToken = CancelToken();

  ref.onDispose(() {
    cancelToken.cancel();
  });

  try {
    // case offline mode - read from database
    if (!ref.watch(isDeviceNotConnectedToAnyNetworkProvider)) {
      final jsonStringFromDatabase = await StorageHelper.readNewsByCategoryFromDatabase(param.newsCategory);

      if (jsonStringFromDatabase != null) {
        final Map<String, dynamic> newsMap = jsonDecode(jsonStringFromDatabase);
        return NewsModel.fromJson(newsMap);
      }
    }

    // case online mode - read from api
    final response = await ref.watch(apiClientProvider).get(
          '${ENV.API_ENDPOINT}/${param.newsCategory.name}',
          queryParameters: {
            'lr': 'en-US',
          },
          cancelToken: cancelToken,
        );

    // convert response.data to NewsModel
    final news = NewsModel.fromJson(response.data);

    // convert NewsModel to json string
    final jsonString = jsonEncode(news.toJson());

    // write to database
    await StorageHelper.writeNewsByCategoryToDatabase(param.newsCategory, jsonString);

    return news;
  } catch (e) {
    if (e is DioException) {
      // case offline mode - read from database
      if (e.type == DioExceptionType.connectionError) {
        final jsonStringFromDatabase = await StorageHelper.readNewsByCategoryFromDatabase(param.newsCategory);

        if (jsonStringFromDatabase == null) rethrow;

        // convert json string to Map<String, dynamic>
        final Map<String, dynamic> newsMap = jsonDecode(jsonStringFromDatabase);

        // convert Map<String, dynamic> to NewsModel
        final news = NewsModel.fromJson(newsMap);

        return news;
      }
    }

    rethrow;
  }
});

class GetNewsByCategoryParam extends Equatable {
  final NewsCategory newsCategory;

  const GetNewsByCategoryParam({
    required this.newsCategory,
  });

  @override
  List<Object> get props => [newsCategory];
}

///
/// use for mock when api has rate limit.
///
Future<NewsModel> mockGetNewsByCategory(NewsCategory newsCategory) async {
  NewsModel newsFromMcok = NewsModel.fromJson({});

  await Future.delayed(const Duration(seconds: 1));

  if (newsCategory.name == NewsCategory.latest.name) newsFromMcok = NewsModel.fromJson(mockNewsByLasted);
  if (newsCategory.name == NewsCategory.entertainment.name) newsFromMcok = NewsModel.fromJson(mockNewsByEntertainment);
  if (newsCategory.name == NewsCategory.world.name) newsFromMcok = NewsModel.fromJson(mockNewsByWorld);
  if (newsCategory.name == NewsCategory.business.name) newsFromMcok = NewsModel.fromJson(mockNewsByBusiness);
  if (newsCategory.name == NewsCategory.health.name) newsFromMcok = NewsModel.fromJson(mockNewsByHealth);
  if (newsCategory.name == NewsCategory.sport.name) newsFromMcok = NewsModel.fromJson(mockNewsBySport);
  if (newsCategory.name == NewsCategory.science.name) newsFromMcok = NewsModel.fromJson(mockNewsByScience);
  if (newsCategory.name == NewsCategory.technology.name) newsFromMcok = NewsModel.fromJson(mockNewsByTechnology);

  // convert NewsModel to json string
  final jsonString = jsonEncode(newsFromMcok.toJson());

  // write to database
  await StorageHelper.writeNewsByCategoryToDatabase(newsCategory, jsonString);

  return newsFromMcok;
}
