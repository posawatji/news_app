import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../enum/news_category.dart';
import '../../../models/news_item_model/news_item_model.dart';
import '../../../utils/date_util.dart';
import '../../news_detail_page/news_detail_page.dart';
import '../button/news_saved_button.dart';
import '../button/to_button.dart';
import 'app_cached_network_image.dart';

class NewsCarouselWidget extends HookConsumerWidget {
  const NewsCarouselWidget({
    super.key,
    required this.initialPage,
    required this.newsCategory,
    required this.newsList,
    this.controller,
    this.onPageChanged,
  });

  final int initialPage;
  final NewsCategory newsCategory;
  final List<NewsItemModel> newsList;
  final PageController? controller;
  final void Function(int)? onPageChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = PageController(initialPage: initialPage);
    final currentPageIndex = useState<int>(0);

    useAutomaticKeepAlive();

    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: [
          Expanded(
            flex: 4,
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              onPageChanged: (index) {
                currentPageIndex.value = index;
                onPageChanged?.call(index);
              },
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                ///
                /// Corousel Card
                ///
                return ToButton(
                  onPressed: () async {
                    await NewsDetailPage.show(
                      context,
                      args: NewsDetailPageArguments(news: newsList[index]),
                    );
                  },
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: constraints.maxWidth > 500 ? 500 : constraints.maxWidth,
                    ),
                    clipBehavior: Clip.hardEdge,
                    margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade100,
                      border: Border.all(color: Colors.deepPurple.shade50),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple.shade100,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                  ),
                                ),
                                child: AppCachedNetworkImage(
                                  imageUrl: newsList[index].images.thumbnail,
                                ),
                              ),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        DateUtil.dateAndTimeFromTimestampString(newsList[index].timestamp),
                                        style: Theme.of(context).textTheme.titleMedium,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        newsList[index].title,
                                        style: Theme.of(context).textTheme.titleLarge,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        newsList[index].snippet,
                                        style: Theme.of(context).textTheme.bodyMedium,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Category: ${newsCategory.name}',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white),
                                ),
                                Text(
                                  '${index + 1}/${newsList.length}',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          ///
          /// Control buttons and bookmark button
          ///
          Container(
            constraints: BoxConstraints(
              maxWidth: constraints.maxWidth > 500 ? 500 : constraints.maxWidth * 0.8,
            ),
            height: 70,
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Row(
              children: [
                Expanded(
                  child: _CarouselWidgetControlButton.previousActionButton(
                    isFirstPage: currentPageIndex.value == 0,
                    pageController: pageController,
                  ),
                ),
                const SizedBox(width: 16),
                NewsSavedButton(news: newsList[currentPageIndex.value]),
                const SizedBox(width: 16),
                Expanded(
                  child: _CarouselWidgetControlButton.nextActionButton(
                    isLastPage: currentPageIndex.value == newsList.length - 1,
                    pageController: pageController,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}

class _CarouselWidgetControlButton extends HookConsumerWidget {
  const _CarouselWidgetControlButton({
    required this.icon,
    required this.backgroundColor,
    this.onPressed,
  });

  final Icon icon;
  final Color backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ToButton(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(16),
      onPressed: onPressed,
      child: SizedBox(
        child: Center(child: icon),
      ),
    );
  }

  static Widget previousActionButton({
    required PageController pageController,
    required bool isFirstPage,
  }) {
    void Function()? onPressed(bool isFirstPage) {
      if (isFirstPage) return null;

      return () async {
        await pageController.previousPage(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
        );
      };
    }

    Color iconColor(bool isFirstPage) {
      if (isFirstPage) return Colors.grey;
      return Colors.deepPurple;
    }

    Color backgroundColor(bool isFirstPage) {
      if (isFirstPage) return Colors.grey.shade200;
      return Colors.deepPurple.shade50;
    }

    return _CarouselWidgetControlButton(
      onPressed: onPressed(isFirstPage),
      icon: Icon(
        Icons.arrow_left_rounded,
        size: 60,
        color: iconColor(isFirstPage),
      ),
      backgroundColor: backgroundColor(isFirstPage),
    );
  }

  static Widget nextActionButton({
    required PageController pageController,
    required bool isLastPage,
  }) {
    void Function()? onPressed(bool isLastPage) {
      if (isLastPage) return null;

      return () async {
        await pageController.nextPage(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
        );
      };
    }

    Color iconColor(bool isLastPage) {
      if (isLastPage) return Colors.grey;
      return Colors.deepPurple;
    }

    Color backgroundColor(bool isLastPage) {
      if (isLastPage) return Colors.grey.shade200;

      return Colors.deepPurple.shade50;
    }

    return _CarouselWidgetControlButton(
      onPressed: onPressed(isLastPage),
      icon: Icon(
        Icons.arrow_right_rounded,
        size: 60,
        color: iconColor(isLastPage),
      ),
      backgroundColor: backgroundColor(isLastPage),
    );
  }
}
