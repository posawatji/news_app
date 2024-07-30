// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_item_sub_news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsItemSubNewsModelImpl _$$NewsItemSubNewsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NewsItemSubNewsModelImpl(
      title: json['title'] as String? ?? '',
      snippet: json['snippet'] as String? ?? '',
      publisher: json['publisher'] as String? ?? '',
      timestamp: json['timestamp'] as String? ?? '',
      newsUrl: json['newsUrl'] as String? ?? '',
      images: json['images'] == null
          ? const NewsItemImagesModel()
          : NewsItemImagesModel.fromJson(
              json['images'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NewsItemSubNewsModelImplToJson(
        _$NewsItemSubNewsModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'snippet': instance.snippet,
      'publisher': instance.publisher,
      'timestamp': instance.timestamp,
      'newsUrl': instance.newsUrl,
      'images': instance.images,
    };
