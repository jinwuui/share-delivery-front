// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_res_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginResDTO _$LoginResDTOFromJson(Map<String, dynamic> json) {
  return _LoginResDTO.fromJson(json);
}

/// @nodoc
mixin _$LoginResDTO {
  User get account => throw _privateConstructorUsedError;
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginResDTOCopyWith<LoginResDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResDTOCopyWith<$Res> {
  factory $LoginResDTOCopyWith(
          LoginResDTO value, $Res Function(LoginResDTO) then) =
      _$LoginResDTOCopyWithImpl<$Res>;
  $Res call({User account, String accessToken, String refreshToken});

  $UserCopyWith<$Res> get account;
}

/// @nodoc
class _$LoginResDTOCopyWithImpl<$Res> implements $LoginResDTOCopyWith<$Res> {
  _$LoginResDTOCopyWithImpl(this._value, this._then);

  final LoginResDTO _value;
  // ignore: unused_field
  final $Res Function(LoginResDTO) _then;

  @override
  $Res call({
    Object? account = freezed,
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_value.copyWith(
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as User,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $UserCopyWith<$Res> get account {
    return $UserCopyWith<$Res>(_value.account, (value) {
      return _then(_value.copyWith(account: value));
    });
  }
}

/// @nodoc
abstract class _$$_LoginResDTOCopyWith<$Res>
    implements $LoginResDTOCopyWith<$Res> {
  factory _$$_LoginResDTOCopyWith(
          _$_LoginResDTO value, $Res Function(_$_LoginResDTO) then) =
      __$$_LoginResDTOCopyWithImpl<$Res>;
  @override
  $Res call({User account, String accessToken, String refreshToken});

  @override
  $UserCopyWith<$Res> get account;
}

/// @nodoc
class __$$_LoginResDTOCopyWithImpl<$Res> extends _$LoginResDTOCopyWithImpl<$Res>
    implements _$$_LoginResDTOCopyWith<$Res> {
  __$$_LoginResDTOCopyWithImpl(
      _$_LoginResDTO _value, $Res Function(_$_LoginResDTO) _then)
      : super(_value, (v) => _then(v as _$_LoginResDTO));

  @override
  _$_LoginResDTO get _value => super._value as _$_LoginResDTO;

  @override
  $Res call({
    Object? account = freezed,
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_$_LoginResDTO(
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as User,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoginResDTO implements _LoginResDTO {
  const _$_LoginResDTO(
      {required this.account,
      required this.accessToken,
      required this.refreshToken});

  factory _$_LoginResDTO.fromJson(Map<String, dynamic> json) =>
      _$$_LoginResDTOFromJson(json);

  @override
  final User account;
  @override
  final String accessToken;
  @override
  final String refreshToken;

  @override
  String toString() {
    return 'LoginResDTO(account: $account, accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginResDTO &&
            const DeepCollectionEquality().equals(other.account, account) &&
            const DeepCollectionEquality()
                .equals(other.accessToken, accessToken) &&
            const DeepCollectionEquality()
                .equals(other.refreshToken, refreshToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(account),
      const DeepCollectionEquality().hash(accessToken),
      const DeepCollectionEquality().hash(refreshToken));

  @JsonKey(ignore: true)
  @override
  _$$_LoginResDTOCopyWith<_$_LoginResDTO> get copyWith =>
      __$$_LoginResDTOCopyWithImpl<_$_LoginResDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginResDTOToJson(this);
  }
}

abstract class _LoginResDTO implements LoginResDTO {
  const factory _LoginResDTO(
      {required final User account,
      required final String accessToken,
      required final String refreshToken}) = _$_LoginResDTO;

  factory _LoginResDTO.fromJson(Map<String, dynamic> json) =
      _$_LoginResDTO.fromJson;

  @override
  User get account => throw _privateConstructorUsedError;
  @override
  String get accessToken => throw _privateConstructorUsedError;
  @override
  String get refreshToken => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LoginResDTOCopyWith<_$_LoginResDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
