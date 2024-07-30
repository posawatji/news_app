import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../models/news_item_model/news_item_model.dart';
import '../../../utils/date_util.dart';
import '../../news_detail_page/news_detail_page.dart';
import '../button/news_saved_button.dart';
import '../button/to_button.dart';
import 'app_cached_network_image.dart';

class NewsItemSmallCard extends HookConsumerWidget {
  const NewsItemSmallCard({
    super.key,
    required this.news,
  });

  final NewsItemModel news;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ToButton(
      onPressed: () async {
        await NewsDetailPage.show(
          context,
          args: NewsDetailPageArguments(news: news),
        );
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.deepPurple.shade50),
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
              child: AppCachedNetworkImage(imageUrl: news.images.thumbnail),
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                news.title,
                                style: Theme.of(context).textTheme.titleMedium,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(width: 8),
                            NewsSavedButton(news: news, size: 40)
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          news.snippet,
                          style: Theme.of(context).textTheme.bodyMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                        Text(
                          DateUtil.dateAndTimeFromTimestampString(news.timestamp),
                          style: Theme.of(context).textTheme.titleSmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
