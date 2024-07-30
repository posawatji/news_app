// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_item_sub_news_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NewsItemSubNewsModel _$NewsItemSubNewsModelFromJson(Map<String, dynamic> json) {
return _NewsItemSubNewsModel.fromJson(json);
}

/// @nodoc
mixin _$NewsItemSubNewsModel {

 String get title => throw _privateConstructorUsedError; String get snippet => throw _privateConstructorUsedError; String get publisher => throw _privateConstructorUsedError; String get timestamp => throw _privateConstructorUsedError; String get newsUrl => throw _privateConstructorUsedError; NewsItemImagesModel get images => throw _privateConstructorUsedError;






Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
@JsonKey(ignore: true)
$NewsItemSubNewsModelCopyWith<NewsItemSubNewsModel> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $NewsItemSubNewsModelCopyWith<$Res>  {
  factory $NewsItemSubNewsModelCopyWith(NewsItemSubNewsModel value, $Res Function(NewsItemSubNewsModel) then) = _$NewsItemSubNewsModelCopyWithImpl<$Res, NewsItemSubNewsModel>;
@useResult
$Res call({
 String title, String snippet, String publisher, String timestamp, String newsUrl, NewsItemImagesModel images
});


$NewsItemImagesModelCopyWith<$Res> get images;
}

/// @nodoc
class _$NewsItemSubNewsModelCopyWithImpl<$Res,$Val extends NewsItemSubNewsModel> implements $NewsItemSubNewsModelCopyWith<$Res> {
  _$NewsItemSubNewsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? snippet = null,Object? publisher = null,Object? timestamp = null,Object? newsUrl = null,Object? images = null,}) {
  return _then(_value.copyWith(
title: null == title ? _value.title : title // ignore: cast_nullable_to_non_nullable
as String,snippet: null == snippet ? _value.snippet : snippet // ignore: cast_nullable_to_non_nullable
as String,publisher: null == publisher ? _value.publisher : publisher // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _value.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String,newsUrl: null == newsUrl ? _value.newsUrl : newsUrl // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _value.images : images // ignore: cast_nullable_to_non_nullable
as NewsItemImagesModel,
  )as $Val);
}
@override
@pragma('vm:prefer-inline')
$NewsItemImagesModelCopyWith<$Res> get images {
  
  return $NewsItemImagesModelCopyWith<$Res>(_value.images, (value) {
    return _then(_value.copyWith(images: value) as $Val);
  });
}
}


/// @nodoc
abstract class _$$NewsItemSubNewsModelImplCopyWith<$Res> implements $NewsItemSubNewsModelCopyWith<$Res> {
  factory _$$NewsItemSubNewsModelImplCopyWith(_$NewsItemSubNewsModelImpl value, $Res Function(_$NewsItemSubNewsModelImpl) then) = __$$NewsItemSubNewsModelImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 String title, String snippet, String publisher, String timestamp, String newsUrl, NewsItemImagesModel images
});


@override $NewsItemImagesModelCopyWith<$Res> get images;
}

/// @nodoc
class __$$NewsItemSubNewsModelImplCopyWithImpl<$Res> extends _$NewsItemSubNewsModelCopyWithImpl<$Res, _$NewsItemSubNewsModelImpl> implements _$$NewsItemSubNewsModelImplCopyWith<$Res> {
  __$$NewsItemSubNewsModelImplCopyWithImpl(_$NewsItemSubNewsModelImpl _value, $Res Function(_$NewsItemSubNewsModelImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? snippet = null,Object? publisher = null,Object? timestamp = null,Object? newsUrl = null,Object? images = null,}) {
  return _then(_$NewsItemSubNewsModelImpl(
title: null == title ? _value.title : title // ignore: cast_nullable_to_non_nullable
as String,snippet: null == snippet ? _value.snippet : snippet // ignore: cast_nullable_to_non_nullable
as String,publisher: null == publisher ? _value.publisher : publisher // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _value.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String,newsUrl: null == newsUrl ? _value.newsUrl : newsUrl // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _value.images : images // ignore: cast_nullable_to_non_nullable
as NewsItemImagesModel,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$NewsItemSubNewsModelImpl extends _NewsItemSubNewsModel  {
  const _$NewsItemSubNewsModelImpl({this.title = '', this.snippet = '', this.publisher = '', this.timestamp = '', this.newsUrl = '', this.images = const NewsItemImagesModel()}): super._();

  factory _$NewsItemSubNewsModelImpl.fromJson(Map<String, dynamic> json) => _$$NewsItemSubNewsModelImplFromJson(json);

@override@JsonKey() final  String title;
@override@JsonKey() final  String snippet;
@override@JsonKey() final  String publisher;
@override@JsonKey() final  String timestamp;
@override@JsonKey() final  String newsUrl;
@override@JsonKey() final  NewsItemImagesModel images;

@override
String toString() {
  return 'NewsItemSubNewsModel(title: $title, snippet: $snippet, publisher: $publisher, timestamp: $timestamp, newsUrl: $newsUrl, images: $images)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$NewsItemSubNewsModelImpl&&(identical(other.title, title) || other.title == title)&&(identical(other.snippet, snippet) || other.snippet == snippet)&&(identical(other.publisher, publisher) || other.publisher == publisher)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.newsUrl, newsUrl) || other.newsUrl == newsUrl)&&(identical(other.images, images) || other.images == images));
}

@JsonKey(ignore: true)
@override
int get hashCode => Object.hash(runtimeType,title,snippet,publisher,timestamp,newsUrl,images);

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$NewsItemSubNewsModelImplCopyWith<_$NewsItemSubNewsModelImpl> get copyWith => __$$NewsItemSubNewsModelImplCopyWithImpl<_$NewsItemSubNewsModelImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$NewsItemSubNewsModelImplToJson(this, );
}
}


abstract class _NewsItemSubNewsModel extends NewsItemSubNewsModel {
  const factory _NewsItemSubNewsModel({final  String title, final  String snippet, final  String publisher, final  String timestamp, final  String newsUrl, final  NewsItemImagesModel images}) = _$NewsItemSubNewsModelImpl;
  const _NewsItemSubNewsModel._(): super._();

  factory _NewsItemSubNewsModel.fromJson(Map<String, dynamic> json) = _$NewsItemSubNewsModelImpl.fromJson;

@override  String get title;@override  String get snippet;@override  String get publisher;@override  String get timestamp;@override  String get newsUrl;@override  NewsItemImagesModel get images;
@override @JsonKey(ignore: true)
_$$NewsItemSubNewsModelImplCopyWith<_$NewsItemSubNewsModelImpl> get copyWith => throw _privateConstructorUsedError;

}
