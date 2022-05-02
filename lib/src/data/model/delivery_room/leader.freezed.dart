// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'leader.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Leader _$LeaderFromJson(Map<String, dynamic> json) {
  return _Leader.fromJson(json);
}

/// @nodoc
mixin _$Leader {
  String get nickname => throw _privateConstructorUsedError;
  double get mannerScore => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeaderCopyWith<Leader> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaderCopyWith<$Res> {
  factory $LeaderCopyWith(Leader value, $Res Function(Leader) then) =
      _$LeaderCopyWithImpl<$Res>;
  $Res call({String nickname, double mannerScore});
}

/// @nodoc
class _$LeaderCopyWithImpl<$Res> implements $LeaderCopyWith<$Res> {
  _$LeaderCopyWithImpl(this._value, this._then);

  final Leader _value;
  // ignore: unused_field
  final $Res Function(Leader) _then;

  @override
  $Res call({
    Object? nickname = freezed,
    Object? mannerScore = freezed,
  }) {
    return _then(_value.copyWith(
      nickname: nickname == freezed
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      mannerScore: mannerScore == freezed
          ? _value.mannerScore
          : mannerScore // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$LeaderCopyWith<$Res> implements $LeaderCopyWith<$Res> {
  factory _$LeaderCopyWith(_Leader value, $Res Function(_Leader) then) =
      __$LeaderCopyWithImpl<$Res>;
  @override
  $Res call({String nickname, double mannerScore});
}

/// @nodoc
class __$LeaderCopyWithImpl<$Res> extends _$LeaderCopyWithImpl<$Res>
    implements _$LeaderCopyWith<$Res> {
  __$LeaderCopyWithImpl(_Leader _value, $Res Function(_Leader) _then)
      : super(_value, (v) => _then(v as _Leader));

  @override
  _Leader get _value => super._value as _Leader;

  @override
  $Res call({
    Object? nickname = freezed,
    Object? mannerScore = freezed,
  }) {
    return _then(_Leader(
      nickname: nickname == freezed
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      mannerScore: mannerScore == freezed
          ? _value.mannerScore
          : mannerScore // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Leader implements _Leader {
  const _$_Leader({required this.nickname, required this.mannerScore});

  factory _$_Leader.fromJson(Map<String, dynamic> json) =>
      _$$_LeaderFromJson(json);

  @override
  final String nickname;
  @override
  final double mannerScore;

  @override
  String toString() {
    return 'Leader(nickname: $nickname, mannerScore: $mannerScore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Leader &&
            const DeepCollectionEquality().equals(other.nickname, nickname) &&
            const DeepCollectionEquality()
                .equals(other.mannerScore, mannerScore));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(nickname),
      const DeepCollectionEquality().hash(mannerScore));

  @JsonKey(ignore: true)
  @override
  _$LeaderCopyWith<_Leader> get copyWith =>
      __$LeaderCopyWithImpl<_Leader>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LeaderToJson(this);
  }
}

abstract class _Leader implements Leader {
  const factory _Leader(
      {required final String nickname,
      required final double mannerScore}) = _$_Leader;

  factory _Leader.fromJson(Map<String, dynamic> json) = _$_Leader.fromJson;

  @override
  String get nickname => throw _privateConstructorUsedError;
  @override
  double get mannerScore => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LeaderCopyWith<_Leader> get copyWith => throw _privateConstructorUsedError;
}
