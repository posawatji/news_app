import 'package:freezed_annotation/freezed_annotation.dart';

import '../news_item_images_model/news_item_images_model.dart';
import '../news_item_sub_news_model/news_item_sub_news_model.dart';

part 'news_item_model.freezed.dart';
part 'news_item_model.g.dart';

@freezed
class NewsItemModel with _$NewsItemModel {
  const NewsItemModel._();

  const factory NewsItemModel({
    @Default('') String title,
    @Default('') String snippet,
    @Default('') String publisher,
    @Default('') String timestamp,
    @Default('') String newsUrl,
    @Default(NewsItemImagesModel()) NewsItemImagesModel images,
    @Default(false) bool hasSubnews,
    @Default([]) List<NewsItemSubNewsModel> subnews,
  }) = _NewsItemModel;

  factory NewsItemModel.fromJson(Map<String, Object?> json) => _$NewsItemModelFromJson(json);
}
