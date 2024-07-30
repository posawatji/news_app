import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/news_item_model/news_item_model.dart';
import '../common/customs/news_item_small_card.dart';

class NewsSavedItemsPageList extends HookConsumerWidget {
  const NewsSavedItemsPageList({
    super.key,
    required this.newsList,
  });

  final List<NewsItemModel> newsList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      itemCount: newsList.length,
      itemBuilder: (context, index) {
        final news = newsList[index];

        return Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
          child: NewsItemSmallCard(news: news),
        );
      },
    );
  }
}
