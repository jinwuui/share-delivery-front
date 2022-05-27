// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fast_matching_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FastMatchingInfo _$FastMatchingInfoFromJson(Map<String, dynamic> json) {
  return _FastMatchingInfo.fromJson(json);
}

/// @nodoc
mixin _$FastMatchingInfo {
  int get matchingId => throw _privateConstructorUsedError;
  String get matchingTag => throw _privateConstructorUsedError;
  DateTime get participatedDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FastMatchingInfoCopyWith<FastMatchingInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FastMatchingInfoCopyWith<$Res> {
  factory $FastMatchingInfoCopyWith(
          FastMatchingInfo value, $Res Function(FastMatchingInfo) then) =
      _$FastMatchingInfoCopyWithImpl<$Res>;
  $Res call(
      {int matchingId, String matchingTag, DateTime participatedDateTime});
}

/// @nodoc
class _$FastMatchingInfoCopyWithImpl<$Res>
    implements $FastMatchingInfoCopyWith<$Res> {
  _$FastMatchingInfoCopyWithImpl(this._value, this._then);

  final FastMatchingInfo _value;
  // ignore: unused_field
  final $Res Function(FastMatchingInfo) _then;

  @override
  $Res call({
    Object? matchingId = freezed,
    Object? matchingTag = freezed,
    Object? participatedDateTime = freezed,
  }) {
    return _then(_value.copyWith(
      matchingId: matchingId == freezed
          ? _value.matchingId
          : matchingId // ignore: cast_nullable_to_non_nullable
              as int,
      matchingTag: matchingTag == freezed
          ? _value.matchingTag
          : matchingTag // ignore: cast_nullable_to_non_nullable
              as String,
      participatedDateTime: participatedDateTime == freezed
          ? _value.participatedDateTime
          : participatedDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_FastMatchingInfoCopyWith<$Res>
    implements $FastMatchingInfoCopyWith<$Res> {
  factory _$$_FastMatchingInfoCopyWith(
          _$_FastMatchingInfo value, $Res Function(_$_FastMatchingInfo) then) =
      __$$_FastMatchingInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {int matchingId, String matchingTag, DateTime participatedDateTime});
}

/// @nodoc
class __$$_FastMatchingInfoCopyWithImpl<$Res>
    extends _$FastMatchingInfoCopyWithImpl<$Res>
    implements _$$_FastMatchingInfoCopyWith<$Res> {
  __$$_FastMatchingInfoCopyWithImpl(
      _$_FastMatchingInfo _value, $Res Function(_$_FastMatchingInfo) _then)
      : super(_value, (v) => _then(v as _$_FastMatchingInfo));

  @override
  _$_FastMatchingInfo get _value => super._value as _$_FastMatchingInfo;

  @override
  $Res call({
    Object? matchingId = freezed,
    Object? matchingTag = freezed,
    Object? participatedDateTime = freezed,
  }) {
    return _then(_$_FastMatchingInfo(
      matchingId: matchingId == freezed
          ? _value.matchingId
          : matchingId // ignore: cast_nullable_to_non_nullable
              as int,
      matchingTag: matchingTag == freezed
          ? _value.matchingTag
          : matchingTag // ignore: cast_nullable_to_non_nullable
              as String,
      participatedDateTime: participatedDateTime == freezed
          ? _value.participatedDateTime
          : participatedDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FastMatchingInfo implements _FastMatchingInfo {
  const _$_FastMatchingInfo(
      {required this.matchingId,
      required this.matchingTag,
      required this.participatedDateTime});

  factory _$_FastMatchingInfo.fromJson(Map<String, dynamic> json) =>
      _$$_FastMatchingInfoFromJson(json);

  @override
  final int matchingId;
  @override
  final String matchingTag;
  @override
  final DateTime participatedDateTime;

  @override
  String toString() {
    return 'FastMatchingInfo(matchingId: $matchingId, matchingTag: $matchingTag, participatedDateTime: $participatedDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FastMatchingInfo &&
            const DeepCollectionEquality()
                .equals(other.matchingId, matchingId) &&
            const DeepCollectionEquality()
                .equals(other.matchingTag, matchingTag) &&
            const DeepCollectionEquality()
                .equals(other.participatedDateTime, participatedDateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(matchingId),
      const DeepCollectionEquality().hash(matchingTag),
      const DeepCollectionEquality().hash(participatedDateTime));

  @JsonKey(ignore: true)
  @override
  _$$_FastMatchingInfoCopyWith<_$_FastMatchingInfo> get copyWith =>
      __$$_FastMatchingInfoCopyWithImpl<_$_FastMatchingInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FastMatchingInfoToJson(this);
  }
}

abstract class _FastMatchingInfo implements FastMatchingInfo {
  const factory _FastMatchingInfo(
      {required final int matchingId,
      required final String matchingTag,
      required final DateTime participatedDateTime}) = _$_FastMatchingInfo;

  factory _FastMatchingInfo.fromJson(Map<String, dynamic> json) =
      _$_FastMatchingInfo.fromJson;

  @override
  int get matchingId => throw _privateConstructorUsedError;
  @override
  String get matchingTag => throw _privateConstructorUsedError;
  @override
  DateTime get participatedDateTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FastMatchingInfoCopyWith<_$_FastMatchingInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
