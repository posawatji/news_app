import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../helpers/storage.dart';
import '../../../models/news_item_model/news_item_model.dart';
import '../../../provider/is_news_item_saved_provider.dart';
import '../../../provider/news_save_items_list_provider.dart';
import '../snack_bar/app_snack_bar.dart';

class NewsSavedButton extends HookConsumerWidget {
  const NewsSavedButton({
    super.key,
    required this.news,
    this.size = 60,
  });

  final NewsItemModel news;
  final double size;

  static const keys = (
    saved: Key('news_saved_button_saved'),
    unSaved: Key('news_saved_button_unsaved'),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () async {
        try {
          final isSaved = await ref.watch(isNewsItemSavedProvider(news).future);

          if (!isSaved) {
            await StorageHelper.addNewsSavedItems(news);
          } else {
            await StorageHelper.removeNewsSavedItemsByItem(news);
          }

          ref.invalidate(isNewsItemSavedProvider(news));
          ref.invalidate(newsSaveItemsListProviderProvider);
        } catch (e) {
          AppSnackBar.showSavedOrUnsavedError(context);

          ref.invalidate(isNewsItemSavedProvider(news));
          ref.invalidate(newsSaveItemsListProviderProvider);
        }
      },
      child: ref.watch(isNewsItemSavedProvider(news)).when(
        data: (isSaved) {
          return Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade50,
              shape: BoxShape.circle,
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: isSaved ? _savedIcon(size) : _unsavedIcon(size),
            ),
          );
        },
        error: (error, stackTrace) {
          return _unsavedIcon(size);
        },
        loading: () {
          return _unsavedIcon(size);
        },
      ),
    );
  }

  Widget _unsavedIcon(size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade50,
        shape: BoxShape.circle,
      ),
      child: Icon(
        key: keys.unSaved,
        Icons.favorite_outline,
        color: Colors.deepPurple,
        size: size / 2,
      ),
    );
  }

  Widget _savedIcon(size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade50,
        shape: BoxShape.circle,
      ),
      child: Icon(
        key: keys.saved,
        Icons.favorite,
        color: Colors.deepPurple,
        size: size / 2,
      ),
    );
  }
}
