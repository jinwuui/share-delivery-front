// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
mixin _$Post {
  int get postId => throw _privateConstructorUsedError;
  PostLocation get coordinate => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get postCategory => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res>;
  $Res call(
      {int postId,
      PostLocation coordinate,
      String content,
      String postCategory});

  $PostLocationCopyWith<$Res> get coordinate;
}

/// @nodoc
class _$PostCopyWithImpl<$Res> implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  final Post _value;
  // ignore: unused_field
  final $Res Function(Post) _then;

  @override
  $Res call({
    Object? postId = freezed,
    Object? coordinate = freezed,
    Object? content = freezed,
    Object? postCategory = freezed,
  }) {
    return _then(_value.copyWith(
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      coordinate: coordinate == freezed
          ? _value.coordinate
          : coordinate // ignore: cast_nullable_to_non_nullable
              as PostLocation,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      postCategory: postCategory == freezed
          ? _value.postCategory
          : postCategory // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $PostLocationCopyWith<$Res> get coordinate {
    return $PostLocationCopyWith<$Res>(_value.coordinate, (value) {
      return _then(_value.copyWith(coordinate: value));
    });
  }
}

/// @nodoc
abstract class _$$_PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$_PostCopyWith(_$_Post value, $Res Function(_$_Post) then) =
      __$$_PostCopyWithImpl<$Res>;
  @override
  $Res call(
      {int postId,
      PostLocation coordinate,
      String content,
      String postCategory});

  @override
  $PostLocationCopyWith<$Res> get coordinate;
}

/// @nodoc
class __$$_PostCopyWithImpl<$Res> extends _$PostCopyWithImpl<$Res>
    implements _$$_PostCopyWith<$Res> {
  __$$_PostCopyWithImpl(_$_Post _value, $Res Function(_$_Post) _then)
      : super(_value, (v) => _then(v as _$_Post));

  @override
  _$_Post get _value => super._value as _$_Post;

  @override
  $Res call({
    Object? postId = freezed,
    Object? coordinate = freezed,
    Object? content = freezed,
    Object? postCategory = freezed,
  }) {
    return _then(_$_Post(
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      coordinate: coordinate == freezed
          ? _value.coordinate
          : coordinate // ignore: cast_nullable_to_non_nullable
              as PostLocation,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      postCategory: postCategory == freezed
          ? _value.postCategory
          : postCategory // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Post implements _Post {
  const _$_Post(
      {this.postId = -1,
      required this.coordinate,
      required this.content,
      required this.postCategory});

  factory _$_Post.fromJson(Map<String, dynamic> json) => _$$_PostFromJson(json);

  @override
  @JsonKey()
  final int postId;
  @override
  final PostLocation coordinate;
  @override
  final String content;
  @override
  final String postCategory;

  @override
  String toString() {
    return 'Post(postId: $postId, coordinate: $coordinate, content: $content, postCategory: $postCategory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Post &&
            const DeepCollectionEquality().equals(other.postId, postId) &&
            const DeepCollectionEquality()
                .equals(other.coordinate, coordinate) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality()
                .equals(other.postCategory, postCategory));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(postId),
      const DeepCollectionEquality().hash(coordinate),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(postCategory));

  @JsonKey(ignore: true)
  @override
  _$$_PostCopyWith<_$_Post> get copyWith =>
      __$$_PostCopyWithImpl<_$_Post>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostToJson(this);
  }
}

abstract class _Post implements Post {
  const factory _Post(
      {final int postId,
      required final PostLocation coordinate,
      required final String content,
      required final String postCategory}) = _$_Post;

  factory _Post.fromJson(Map<String, dynamic> json) = _$_Post.fromJson;

  @override
  int get postId => throw _privateConstructorUsedError;
  @override
  PostLocation get coordinate => throw _privateConstructorUsedError;
  @override
  String get content => throw _privateConstructorUsedError;
  @override
  String get postCategory => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PostCopyWith<_$_Post> get copyWith => throw _privateConstructorUsedError;
}

PostLocation _$PostLocationFromJson(Map<String, dynamic> json) {
  return _PostLocation.fromJson(json);
}

/// @nodoc
mixin _$PostLocation {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostLocationCopyWith<PostLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostLocationCopyWith<$Res> {
  factory $PostLocationCopyWith(
          PostLocation value, $Res Function(PostLocation) then) =
      _$PostLocationCopyWithImpl<$Res>;
  $Res call({double latitude, double longitude});
}

/// @nodoc
class _$PostLocationCopyWithImpl<$Res> implements $PostLocationCopyWith<$Res> {
  _$PostLocationCopyWithImpl(this._value, this._then);

  final PostLocation _value;
  // ignore: unused_field
  final $Res Function(PostLocation) _then;

  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_PostLocationCopyWith<$Res>
    implements $PostLocationCopyWith<$Res> {
  factory _$$_PostLocationCopyWith(
          _$_PostLocation value, $Res Function(_$_PostLocation) then) =
      __$$_PostLocationCopyWithImpl<$Res>;
  @override
  $Res call({double latitude, double longitude});
}

/// @nodoc
class __$$_PostLocationCopyWithImpl<$Res>
    extends _$PostLocationCopyWithImpl<$Res>
    implements _$$_PostLocationCopyWith<$Res> {
  __$$_PostLocationCopyWithImpl(
      _$_PostLocation _value, $Res Function(_$_PostLocation) _then)
      : super(_value, (v) => _then(v as _$_PostLocation));

  @override
  _$_PostLocation get _value => super._value as _$_PostLocation;

  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_$_PostLocation(
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostLocation implements _PostLocation {
  const _$_PostLocation({required this.latitude, required this.longitude});

  factory _$_PostLocation.fromJson(Map<String, dynamic> json) =>
      _$$_PostLocationFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'PostLocation(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostLocation &&
            const DeepCollectionEquality().equals(other.latitude, latitude) &&
            const DeepCollectionEquality().equals(other.longitude, longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(latitude),
      const DeepCollectionEquality().hash(longitude));

  @JsonKey(ignore: true)
  @override
  _$$_PostLocationCopyWith<_$_PostLocation> get copyWith =>
      __$$_PostLocationCopyWithImpl<_$_PostLocation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostLocationToJson(this);
  }
}

abstract class _PostLocation implements PostLocation {
  const factory _PostLocation(
      {required final double latitude,
      required final double longitude}) = _$_PostLocation;

  factory _PostLocation.fromJson(Map<String, dynamic> json) =
      _$_PostLocation.fromJson;

  @override
  double get latitude => throw _privateConstructorUsedError;
  @override
  double get longitude => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PostLocationCopyWith<_$_PostLocation> get copyWith =>
      throw _privateConstructorUsedError;
}
