// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fast_matching_tag.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FastMatchingTag _$FastMatchingTagFromJson(Map<String, dynamic> json) {
  return _FastMatchingTag.fromJson(json);
}

/// @nodoc
mixin _$FastMatchingTag {
  String get matchingTag => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FastMatchingTagCopyWith<FastMatchingTag> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FastMatchingTagCopyWith<$Res> {
  factory $FastMatchingTagCopyWith(
          FastMatchingTag value, $Res Function(FastMatchingTag) then) =
      _$FastMatchingTagCopyWithImpl<$Res>;
  $Res call({String matchingTag});
}

/// @nodoc
class _$FastMatchingTagCopyWithImpl<$Res>
    implements $FastMatchingTagCopyWith<$Res> {
  _$FastMatchingTagCopyWithImpl(this._value, this._then);

  final FastMatchingTag _value;
  // ignore: unused_field
  final $Res Function(FastMatchingTag) _then;

  @override
  $Res call({
    Object? matchingTag = freezed,
  }) {
    return _then(_value.copyWith(
      matchingTag: matchingTag == freezed
          ? _value.matchingTag
          : matchingTag // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_FastMatchingTagCopyWith<$Res>
    implements $FastMatchingTagCopyWith<$Res> {
  factory _$$_FastMatchingTagCopyWith(
          _$_FastMatchingTag value, $Res Function(_$_FastMatchingTag) then) =
      __$$_FastMatchingTagCopyWithImpl<$Res>;
  @override
  $Res call({String matchingTag});
}

/// @nodoc
class __$$_FastMatchingTagCopyWithImpl<$Res>
    extends _$FastMatchingTagCopyWithImpl<$Res>
    implements _$$_FastMatchingTagCopyWith<$Res> {
  __$$_FastMatchingTagCopyWithImpl(
      _$_FastMatchingTag _value, $Res Function(_$_FastMatchingTag) _then)
      : super(_value, (v) => _then(v as _$_FastMatchingTag));

  @override
  _$_FastMatchingTag get _value => super._value as _$_FastMatchingTag;

  @override
  $Res call({
    Object? matchingTag = freezed,
  }) {
    return _then(_$_FastMatchingTag(
      matchingTag: matchingTag == freezed
          ? _value.matchingTag
          : matchingTag // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FastMatchingTag implements _FastMatchingTag {
  const _$_FastMatchingTag({required this.matchingTag});

  factory _$_FastMatchingTag.fromJson(Map<String, dynamic> json) =>
      _$$_FastMatchingTagFromJson(json);

  @override
  final String matchingTag;

  @override
  String toString() {
    return 'FastMatchingTag(matchingTag: $matchingTag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FastMatchingTag &&
            const DeepCollectionEquality()
                .equals(other.matchingTag, matchingTag));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(matchingTag));

  @JsonKey(ignore: true)
  @override
  _$$_FastMatchingTagCopyWith<_$_FastMatchingTag> get copyWith =>
      __$$_FastMatchingTagCopyWithImpl<_$_FastMatchingTag>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FastMatchingTagToJson(this);
  }
}

abstract class _FastMatchingTag implements FastMatchingTag {
  const factory _FastMatchingTag({required final String matchingTag}) =
      _$_FastMatchingTag;

  factory _FastMatchingTag.fromJson(Map<String, dynamic> json) =
      _$_FastMatchingTag.fromJson;

  @override
  String get matchingTag => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FastMatchingTagCopyWith<_$_FastMatchingTag> get copyWith =>
      throw _privateConstructorUsedError;
}
