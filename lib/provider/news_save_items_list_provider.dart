import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../helpers/storage.dart';
import '../models/news_item_model/news_item_model.dart';

final newsSaveItemsListProviderProvider = FutureProvider.autoDispose<List<NewsItemModel>>((ref) async {
  final newsSavedItemsList = await StorageHelper.readNewsSavedItemsList();

  return newsSavedItemsList.toList();
});
