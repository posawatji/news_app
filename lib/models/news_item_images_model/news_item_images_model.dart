import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_item_images_model.freezed.dart';
part 'news_item_images_model.g.dart';

@freezed
class NewsItemImagesModel with _$NewsItemImagesModel {
  const NewsItemImagesModel._();

  const factory NewsItemImagesModel({
    @Default('') String thumbnail,
    @Default('') String thumbnailProxied,
  }) = _NewsItemImagesModel;

  factory NewsItemImagesModel.fromJson(Map<String, Object?> json) => _$NewsItemImagesModelFromJson(json);
}
