import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../api/get_news_by_category.dart';
import '../../enum/news_category.dart';
import '../../helpers/database.dart';
import '../../models/news_model/news_model.dart';
import '../common/button/to_button.dart';
import '../common/customs/news_carousel_widget.dart';
import '../common/dialog/loading_dialog.dart';
import '../common/error_state/error_state.dart';
import '../common/error_state/no_data_state.dart';
import '../common/snack_bar/app_snack_bar.dart';

class NewsDiscoveryPage extends HookConsumerWidget {
  const NewsDiscoveryPage({super.key});

  static const routeName = '/news_discovery_page';

  static Future<void> show(BuildContext context) async {
    await Navigator.of(context).pushNamed(routeName);
  }

  static void close(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabBarController =
        useTabController(initialLength: NewsCategory.values.length, initialIndex: 0);
    final pageViewController = usePageController(initialPage: 0);

    AutoDisposeFutureProvider<NewsModel> newsByCategoryProvider(int index) {
      return getNewsByCategoryProvider(
        GetNewsByCategoryParam(
          newsCategory: NewsCategory.values[index],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('News Discovery'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: ToButton(
              onPressed: () async {
                try {
                  log('Clearing...');
                  LoadingDialog.show(context);

                  // Clear cache from database
                  await Database.clear();

                  // Clear image cache
                  DefaultCacheManager manager = DefaultCacheManager();
                  manager.emptyCache();

                  LoadingDialog.close(context);
                  log('Clearing success.');
                } catch (e) {
                  log('Clearing failed. $e');
                  LoadingDialog.close(context);
                  AppSnackBar.showClearCacheError(context);
                }
              },
              child: Text('Clear All Cache', style: Theme.of(context).textTheme.titleSmall),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TabBar(
            controller: tabBarController,
            overlayColor: MaterialStateProperty.resolveWith((states) => Colors.transparent),
            isScrollable: true,
            onTap: (index) async {
              await pageViewController.animateToPage(
                index,
                duration: const Duration(milliseconds: 150),
                curve: Curves.bounceInOut,
              );
            },
            tabAlignment: TabAlignment.start,
            tabs: [
              ...List.generate(
                NewsCategory.values.length,
                (index) => Tab(text: NewsCategory.values[index].name),
              ),
            ],
          ),
          Expanded(
            child: PageView.builder(
              controller: pageViewController,
              onPageChanged: (index) {
                tabBarController.animateTo(index);
              },
              itemBuilder: (context, index) {
                return ref.watch(newsByCategoryProvider(index)).when(
                      data: (news) {
                        if (news == const NewsModel()) {
                          return const NoDataState(
                            icon: Icons.newspaper,
                            title: 'There is No News.',
                          );
                        }
                        return NewsCarouselWidget(
                          initialPage: 0,
                          newsCategory: NewsCategory.values[index],
                          newsList: news.items,
                        );
                      },
                      error: (error, stackTrace) {
                        if (error is DioException) {
                          if (error.type == DioExceptionType.connectionError) {
                            return ErrorState.noInternetConnectionError();
                          }
                          if (error.response?.statusCode == 429) {
                            return ErrorState.rateLimitError(error.response?.data['message']);
                          }

                          if ((error.response?.statusCode ?? 0) >= 500) {
                            return ErrorState.serverError();
                          }
                        }

                        return ErrorState.unknownError();
                      },
                      loading: () => const Center(child: CircularProgressIndicator()),
                    );
              },
              itemCount: NewsCategory.values.length,
            ),
          ),
        ],
      ),
    );
  }
}
