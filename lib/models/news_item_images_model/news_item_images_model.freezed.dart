// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_item_images_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NewsItemImagesModel _$NewsItemImagesModelFromJson(Map<String, dynamic> json) {
return _NewsItemImagesModel.fromJson(json);
}

/// @nodoc
mixin _$NewsItemImagesModel {

 String get thumbnail => throw _privateConstructorUsedError; String get thumbnailProxied => throw _privateConstructorUsedError;






Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
@JsonKey(ignore: true)
$NewsItemImagesModelCopyWith<NewsItemImagesModel> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $NewsItemImagesModelCopyWith<$Res>  {
  factory $NewsItemImagesModelCopyWith(NewsItemImagesModel value, $Res Function(NewsItemImagesModel) then) = _$NewsItemImagesModelCopyWithImpl<$Res, NewsItemImagesModel>;
@useResult
$Res call({
 String thumbnail, String thumbnailProxied
});



}

/// @nodoc
class _$NewsItemImagesModelCopyWithImpl<$Res,$Val extends NewsItemImagesModel> implements $NewsItemImagesModelCopyWith<$Res> {
  _$NewsItemImagesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

@pragma('vm:prefer-inline') @override $Res call({Object? thumbnail = null,Object? thumbnailProxied = null,}) {
  return _then(_value.copyWith(
thumbnail: null == thumbnail ? _value.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,thumbnailProxied: null == thumbnailProxied ? _value.thumbnailProxied : thumbnailProxied // ignore: cast_nullable_to_non_nullable
as String,
  )as $Val);
}

}


/// @nodoc
abstract class _$$NewsItemImagesModelImplCopyWith<$Res> implements $NewsItemImagesModelCopyWith<$Res> {
  factory _$$NewsItemImagesModelImplCopyWith(_$NewsItemImagesModelImpl value, $Res Function(_$NewsItemImagesModelImpl) then) = __$$NewsItemImagesModelImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 String thumbnail, String thumbnailProxied
});



}

/// @nodoc
class __$$NewsItemImagesModelImplCopyWithImpl<$Res> extends _$NewsItemImagesModelCopyWithImpl<$Res, _$NewsItemImagesModelImpl> implements _$$NewsItemImagesModelImplCopyWith<$Res> {
  __$$NewsItemImagesModelImplCopyWithImpl(_$NewsItemImagesModelImpl _value, $Res Function(_$NewsItemImagesModelImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? thumbnail = null,Object? thumbnailProxied = null,}) {
  return _then(_$NewsItemImagesModelImpl(
thumbnail: null == thumbnail ? _value.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,thumbnailProxied: null == thumbnailProxied ? _value.thumbnailProxied : thumbnailProxied // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$NewsItemImagesModelImpl extends _NewsItemImagesModel  {
  const _$NewsItemImagesModelImpl({this.thumbnail = '', this.thumbnailProxied = ''}): super._();

  factory _$NewsItemImagesModelImpl.fromJson(Map<String, dynamic> json) => _$$NewsItemImagesModelImplFromJson(json);

@override@JsonKey() final  String thumbnail;
@override@JsonKey() final  String thumbnailProxied;

@override
String toString() {
  return 'NewsItemImagesModel(thumbnail: $thumbnail, thumbnailProxied: $thumbnailProxied)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$NewsItemImagesModelImpl&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.thumbnailProxied, thumbnailProxied) || other.thumbnailProxied == thumbnailProxied));
}

@JsonKey(ignore: true)
@override
int get hashCode => Object.hash(runtimeType,thumbnail,thumbnailProxied);

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$NewsItemImagesModelImplCopyWith<_$NewsItemImagesModelImpl> get copyWith => __$$NewsItemImagesModelImplCopyWithImpl<_$NewsItemImagesModelImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$NewsItemImagesModelImplToJson(this, );
}
}


abstract class _NewsItemImagesModel extends NewsItemImagesModel {
  const factory _NewsItemImagesModel({final  String thumbnail, final  String thumbnailProxied}) = _$NewsItemImagesModelImpl;
  const _NewsItemImagesModel._(): super._();

  factory _NewsItemImagesModel.fromJson(Map<String, dynamic> json) = _$NewsItemImagesModelImpl.fromJson;

@override  String get thumbnail;@override  String get thumbnailProxied;
@override @JsonKey(ignore: true)
_$$NewsItemImagesModelImplCopyWith<_$NewsItemImagesModelImpl> get copyWith => throw _privateConstructorUsedError;

}
