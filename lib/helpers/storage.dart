import 'dart:convert';

import '../enum/hive_key.dart';
import '../enum/news_category.dart';
import '../models/news_item_model/news_item_model.dart';
import 'database.dart';

abstract class StorageHelper {
  StorageHelper._();

  ///
  /// News By Category
  ///
  static Future<void> writeNewsByCategoryToDatabase(NewsCategory newsCategory, String news) async {
    if (newsCategory.name == NewsCategory.latest.name) return await Database.write(HiveKeys.newsByLatest.name, news);
    if (newsCategory.name == NewsCategory.entertainment.name) return await Database.write(HiveKeys.newsByEntertainment.name, news);
    if (newsCategory.name == NewsCategory.world.name) return await Database.write(HiveKeys.newsByWorld.name, news);
    if (newsCategory.name == NewsCategory.business.name) return await Database.write(HiveKeys.newsByBusiness.name, news);
    if (newsCategory.name == NewsCategory.health.name) return await Database.write(HiveKeys.newsByHealth.name, news);
    if (newsCategory.name == NewsCategory.sport.name) return await Database.write(HiveKeys.newsBySport.name, news);
    if (newsCategory.name == NewsCategory.science.name) return await Database.write(HiveKeys.newsByScience.name, news);
    if (newsCategory.name == NewsCategory.technology.name) return await Database.write(HiveKeys.newsByTechnology.name, news);

    return;
  }

  static Future<String?> readNewsByCategoryFromDatabase(NewsCategory newsCategory) async {
    switch (newsCategory) {
      case NewsCategory.latest:
        return await Database.read(HiveKeys.newsByLatest.name) as String?;
      case NewsCategory.entertainment:
        return await Database.read(HiveKeys.newsByEntertainment.name) as String?;
      case NewsCategory.world:
        return await Database.read(HiveKeys.newsByWorld.name) as String?;
      case NewsCategory.business:
        return await Database.read(HiveKeys.newsByBusiness.name) as String?;
      case NewsCategory.health:
        return await Database.read(HiveKeys.newsByHealth.name) as String?;
      case NewsCategory.sport:
        return await Database.read(HiveKeys.newsBySport.name) as String?;
      case NewsCategory.science:
        return await Database.read(HiveKeys.newsByScience.name) as String?;
      case NewsCategory.technology:
        return await Database.read(HiveKeys.newsByTechnology.name) as String?;

      default:
        return null;
    }
  }

  static Future<void> deleteNewsByCategoryFromDatabase(NewsCategory newsCategory) async {
    if (newsCategory.name == NewsCategory.latest.name) return await Database.delete(HiveKeys.newsByLatest.name);
    if (newsCategory.name == NewsCategory.entertainment.name) return await Database.delete(HiveKeys.newsByEntertainment.name);
    if (newsCategory.name == NewsCategory.world.name) return await Database.delete(HiveKeys.newsByWorld.name);
    if (newsCategory.name == NewsCategory.business.name) return await Database.delete(HiveKeys.newsByBusiness.name);
    if (newsCategory.name == NewsCategory.health.name) return await Database.delete(HiveKeys.newsByHealth.name);
    if (newsCategory.name == NewsCategory.sport.name) return await Database.delete(HiveKeys.newsBySport.name);
    if (newsCategory.name == NewsCategory.science.name) return await Database.delete(HiveKeys.newsByScience.name);
    if (newsCategory.name == NewsCategory.technology.name) return await Database.delete(HiveKeys.newsByTechnology.name);
  }

  ///
  /// News Saved Items
  ///
  static Future<List<NewsItemModel>> readNewsSavedItemsList() async {
    final rawNewsSavedItemsListFromDatabase = await Database.read(HiveKeys.newsSavedItemList.name) as List<dynamic>? ?? [];
    final newsSavedItemsList = rawNewsSavedItemsListFromDatabase.map((e) => NewsItemModel.fromJson(jsonDecode(e ?? '{}'))).toList();
    return newsSavedItemsList;
  }

  static Future<void> addNewsSavedItems(NewsItemModel newsSavedItem) async {
    final newsSavedItemsListFromDatabase = await readNewsSavedItemsList();
    final newsSavedItemsListAfterAdd = newsSavedItemsListFromDatabase.toList();
    newsSavedItemsListAfterAdd.add(newsSavedItem);
    final newsSavedItemsListString = newsSavedItemsListAfterAdd.map((e) => jsonEncode(e.toJson())).toList();

    await Database.write(HiveKeys.newsSavedItemList.name, newsSavedItemsListString);
  }

  static Future<void> removeNewsSavedItemsByItem(NewsItemModel newsSavedItem) async {
    final newsSavedItemsListFromDatabase = await readNewsSavedItemsList();
    final newsSavedItemsListAfterDeleteByItem = newsSavedItemsListFromDatabase.toList();
    newsSavedItemsListAfterDeleteByItem.remove(newsSavedItem);
    final newsSavedItemsListString = newsSavedItemsListAfterDeleteByItem.map((e) => jsonEncode(e.toJson())).toList();

    await Database.write(HiveKeys.newsSavedItemList.name, newsSavedItemsListString);
  }

  static Future<void> clearNewsSavedItemsList() async {
    await Database.delete(HiveKeys.newsSavedItemList.name);
  }
}
