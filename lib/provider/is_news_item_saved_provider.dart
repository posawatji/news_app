import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../helpers/storage.dart';
import '../models/news_item_model/news_item_model.dart';

final isNewsItemSavedProvider = FutureProvider.autoDispose.family<bool, NewsItemModel>((ref, news) async {
  final newsSavedItemsList = await StorageHelper.readNewsSavedItemsList();

  return newsSavedItemsList.contains(news);
});
