// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NewsItemModel _$NewsItemModelFromJson(Map<String, dynamic> json) {
return _NewsItemModel.fromJson(json);
}

/// @nodoc
mixin _$NewsItemModel {

 String get title => throw _privateConstructorUsedError; String get snippet => throw _privateConstructorUsedError; String get publisher => throw _privateConstructorUsedError; String get timestamp => throw _privateConstructorUsedError; String get newsUrl => throw _privateConstructorUsedError; NewsItemImagesModel get images => throw _privateConstructorUsedError; bool get hasSubnews => throw _privateConstructorUsedError; List<NewsItemSubNewsModel> get subnews => throw _privateConstructorUsedError;






Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
@JsonKey(ignore: true)
$NewsItemModelCopyWith<NewsItemModel> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $NewsItemModelCopyWith<$Res>  {
  factory $NewsItemModelCopyWith(NewsItemModel value, $Res Function(NewsItemModel) then) = _$NewsItemModelCopyWithImpl<$Res, NewsItemModel>;
@useResult
$Res call({
 String title, String snippet, String publisher, String timestamp, String newsUrl, NewsItemImagesModel images, bool hasSubnews, List<NewsItemSubNewsModel> subnews
});


$NewsItemImagesModelCopyWith<$Res> get images;
}

/// @nodoc
class _$NewsItemModelCopyWithImpl<$Res,$Val extends NewsItemModel> implements $NewsItemModelCopyWith<$Res> {
  _$NewsItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? snippet = null,Object? publisher = null,Object? timestamp = null,Object? newsUrl = null,Object? images = null,Object? hasSubnews = null,Object? subnews = null,}) {
  return _then(_value.copyWith(
title: null == title ? _value.title : title // ignore: cast_nullable_to_non_nullable
as String,snippet: null == snippet ? _value.snippet : snippet // ignore: cast_nullable_to_non_nullable
as String,publisher: null == publisher ? _value.publisher : publisher // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _value.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String,newsUrl: null == newsUrl ? _value.newsUrl : newsUrl // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _value.images : images // ignore: cast_nullable_to_non_nullable
as NewsItemImagesModel,hasSubnews: null == hasSubnews ? _value.hasSubnews : hasSubnews // ignore: cast_nullable_to_non_nullable
as bool,subnews: null == subnews ? _value.subnews : subnews // ignore: cast_nullable_to_non_nullable
as List<NewsItemSubNewsModel>,
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
abstract class _$$NewsItemModelImplCopyWith<$Res> implements $NewsItemModelCopyWith<$Res> {
  factory _$$NewsItemModelImplCopyWith(_$NewsItemModelImpl value, $Res Function(_$NewsItemModelImpl) then) = __$$NewsItemModelImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 String title, String snippet, String publisher, String timestamp, String newsUrl, NewsItemImagesModel images, bool hasSubnews, List<NewsItemSubNewsModel> subnews
});


@override $NewsItemImagesModelCopyWith<$Res> get images;
}

/// @nodoc
class __$$NewsItemModelImplCopyWithImpl<$Res> extends _$NewsItemModelCopyWithImpl<$Res, _$NewsItemModelImpl> implements _$$NewsItemModelImplCopyWith<$Res> {
  __$$NewsItemModelImplCopyWithImpl(_$NewsItemModelImpl _value, $Res Function(_$NewsItemModelImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? snippet = null,Object? publisher = null,Object? timestamp = null,Object? newsUrl = null,Object? images = null,Object? hasSubnews = null,Object? subnews = null,}) {
  return _then(_$NewsItemModelImpl(
title: null == title ? _value.title : title // ignore: cast_nullable_to_non_nullable
as String,snippet: null == snippet ? _value.snippet : snippet // ignore: cast_nullable_to_non_nullable
as String,publisher: null == publisher ? _value.publisher : publisher // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _value.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String,newsUrl: null == newsUrl ? _value.newsUrl : newsUrl // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _value.images : images // ignore: cast_nullable_to_non_nullable
as NewsItemImagesModel,hasSubnews: null == hasSubnews ? _value.hasSubnews : hasSubnews // ignore: cast_nullable_to_non_nullable
as bool,subnews: null == subnews ? _value._subnews : subnews // ignore: cast_nullable_to_non_nullable
as List<NewsItemSubNewsModel>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$NewsItemModelImpl extends _NewsItemModel  {
  const _$NewsItemModelImpl({this.title = '', this.snippet = '', this.publisher = '', this.timestamp = '', this.newsUrl = '', this.images = const NewsItemImagesModel(), this.hasSubnews = false, final  List<NewsItemSubNewsModel> subnews = const []}): _subnews = subnews,super._();

  factory _$NewsItemModelImpl.fromJson(Map<String, dynamic> json) => _$$NewsItemModelImplFromJson(json);

@override@JsonKey() final  String title;
@override@JsonKey() final  String snippet;
@override@JsonKey() final  String publisher;
@override@JsonKey() final  String timestamp;
@override@JsonKey() final  String newsUrl;
@override@JsonKey() final  NewsItemImagesModel images;
@override@JsonKey() final  bool hasSubnews;
 final  List<NewsItemSubNewsModel> _subnews;
@override@JsonKey() List<NewsItemSubNewsModel> get subnews {
  if (_subnews is EqualUnmodifiableListView) return _subnews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subnews);
}


@override
String toString() {
  return 'NewsItemModel(title: $title, snippet: $snippet, publisher: $publisher, timestamp: $timestamp, newsUrl: $newsUrl, images: $images, hasSubnews: $hasSubnews, subnews: $subnews)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$NewsItemModelImpl&&(identical(other.title, title) || other.title == title)&&(identical(other.snippet, snippet) || other.snippet == snippet)&&(identical(other.publisher, publisher) || other.publisher == publisher)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.newsUrl, newsUrl) || other.newsUrl == newsUrl)&&(identical(other.images, images) || other.images == images)&&(identical(other.hasSubnews, hasSubnews) || other.hasSubnews == hasSubnews)&&const DeepCollectionEquality().equals(other._subnews, _subnews));
}

@JsonKey(ignore: true)
@override
int get hashCode => Object.hash(runtimeType,title,snippet,publisher,timestamp,newsUrl,images,hasSubnews,const DeepCollectionEquality().hash(_subnews));

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$NewsItemModelImplCopyWith<_$NewsItemModelImpl> get copyWith => __$$NewsItemModelImplCopyWithImpl<_$NewsItemModelImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$NewsItemModelImplToJson(this, );
}
}


abstract class _NewsItemModel extends NewsItemModel {
  const factory _NewsItemModel({final  String title, final  String snippet, final  String publisher, final  String timestamp, final  String newsUrl, final  NewsItemImagesModel images, final  bool hasSubnews, final  List<NewsItemSubNewsModel> subnews}) = _$NewsItemModelImpl;
  const _NewsItemModel._(): super._();

  factory _NewsItemModel.fromJson(Map<String, dynamic> json) = _$NewsItemModelImpl.fromJson;

@override  String get title;@override  String get snippet;@override  String get publisher;@override  String get timestamp;@override  String get newsUrl;@override  NewsItemImagesModel get images;@override  bool get hasSubnews;@override  List<NewsItemSubNewsModel> get subnews;
@override @JsonKey(ignore: true)
_$$NewsItemModelImplCopyWith<_$NewsItemModelImpl> get copyWith => throw _privateConstructorUsedError;

}
