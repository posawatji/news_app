import 'package:freezed_annotation/freezed_annotation.dart';

import '../news_item_images_model/news_item_images_model.dart';

part 'news_item_sub_news_model.freezed.dart';
part 'news_item_sub_news_model.g.dart';

@freezed
class NewsItemSubNewsModel with _$NewsItemSubNewsModel {
  const NewsItemSubNewsModel._();

  const factory NewsItemSubNewsModel({
    @Default('') String title,
    @Default('') String snippet,
    @Default('') String publisher,
    @Default('') String timestamp,
    @Default('') String newsUrl,
    @Default(NewsItemImagesModel()) NewsItemImagesModel images,
  }) = _NewsItemSubNewsModel;

  factory NewsItemSubNewsModel.fromJson(Map<String, Object?> json) =>
      _$NewsItemSubNewsModelFromJson(json);
}
