// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsItemModelImpl _$$NewsItemModelImplFromJson(Map<String, dynamic> json) =>
    _$NewsItemModelImpl(
      title: json['title'] as String? ?? '',
      snippet: json['snippet'] as String? ?? '',
      publisher: json['publisher'] as String? ?? '',
      timestamp: json['timestamp'] as String? ?? '',
      newsUrl: json['newsUrl'] as String? ?? '',
      images: json['images'] == null
          ? const NewsItemImagesModel()
          : NewsItemImagesModel.fromJson(
              json['images'] as Map<String, dynamic>),
      hasSubnews: json['hasSubnews'] as bool? ?? false,
      subnews: (json['subnews'] as List<dynamic>?)
              ?.map((e) =>
                  NewsItemSubNewsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$NewsItemModelImplToJson(_$NewsItemModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'snippet': instance.snippet,
      'publisher': instance.publisher,
      'timestamp': instance.timestamp,
      'newsUrl': instance.newsUrl,
      'images': instance.images,
      'hasSubnews': instance.hasSubnews,
      'subnews': instance.subnews,
    };
