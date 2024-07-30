import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../helpers/storage.dart';
import '../../provider/news_save_items_list_provider.dart';
import '../common/error_state/error_state.dart';
import '../common/error_state/no_data_state.dart';
import 'news_saved_items_page_list.dart';

class NewsSavedItemsPage extends HookConsumerWidget {
  const NewsSavedItemsPage({super.key});

  static const routeName = '/news_saved_items_page';

  static Future<void> show(BuildContext context) async {
    await Navigator.of(context).pushNamed(routeName);
  }

  static void close(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('News Saved Items'),
        actions: [
          IconButton(
            onPressed: () async {
              await StorageHelper.clearNewsSavedItemsList();
              ref.invalidate(newsSaveItemsListProviderProvider);
            },
            icon: const Icon(Icons.delete_sweep_rounded),
            tooltip: 'Delete All Saved Items',
          ),
        ],
      ),
      body: ref.watch(newsSaveItemsListProviderProvider).when(
        data: (newsList) {
          if (newsList.isEmpty) {
            return const Center(
              child: NoDataState(
                icon: Icons.favorite_outline,
                title: 'No Saved Items',
              ),
            );
          }

          return NewsSavedItemsPageList(newsList: newsList);
        },
        error: (error, stackTrace) {
          if (error is Exception) {
            return const Center(child: ErrorState());
          }

          return Center(child: ErrorState.unknownError());
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
