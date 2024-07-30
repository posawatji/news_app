import 'package:freezed_annotation/freezed_annotation.dart';

import '../news_item_model/news_item_model.dart';

part 'news_model.freezed.dart';
part 'news_model.g.dart';

@freezed
class NewsModel with _$NewsModel {
  const NewsModel._();
  const factory NewsModel({
    @Default('') String status,
    @Default([]) List<NewsItemModel> items,
  }) = _NewsModel;

  factory NewsModel.fromJson(Map<String, Object?> json) => _$NewsModelFromJson(json);
}
