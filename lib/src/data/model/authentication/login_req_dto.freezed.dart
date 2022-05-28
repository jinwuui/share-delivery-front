// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_req_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginReqDTO _$LoginReqDTOFromJson(Map<String, dynamic> json) {
  return _LoginReqDTO.fromJson(json);
}

/// @nodoc
mixin _$LoginReqDTO {
  String get phoneNumber => throw _privateConstructorUsedError;
  String get verificationCode => throw _privateConstructorUsedError;
  String get fcmToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginReqDTOCopyWith<LoginReqDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginReqDTOCopyWith<$Res> {
  factory $LoginReqDTOCopyWith(
          LoginReqDTO value, $Res Function(LoginReqDTO) then) =
      _$LoginReqDTOCopyWithImpl<$Res>;
  $Res call({String phoneNumber, String verificationCode, String fcmToken});
}

/// @nodoc
class _$LoginReqDTOCopyWithImpl<$Res> implements $LoginReqDTOCopyWith<$Res> {
  _$LoginReqDTOCopyWithImpl(this._value, this._then);

  final LoginReqDTO _value;
  // ignore: unused_field
  final $Res Function(LoginReqDTO) _then;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? verificationCode = freezed,
    Object? fcmToken = freezed,
  }) {
    return _then(_value.copyWith(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      verificationCode: verificationCode == freezed
          ? _value.verificationCode
          : verificationCode // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: fcmToken == freezed
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_LoginReqDTOCopyWith<$Res>
    implements $LoginReqDTOCopyWith<$Res> {
  factory _$$_LoginReqDTOCopyWith(
          _$_LoginReqDTO value, $Res Function(_$_LoginReqDTO) then) =
      __$$_LoginReqDTOCopyWithImpl<$Res>;
  @override
  $Res call({String phoneNumber, String verificationCode, String fcmToken});
}

/// @nodoc
class __$$_LoginReqDTOCopyWithImpl<$Res> extends _$LoginReqDTOCopyWithImpl<$Res>
    implements _$$_LoginReqDTOCopyWith<$Res> {
  __$$_LoginReqDTOCopyWithImpl(
      _$_LoginReqDTO _value, $Res Function(_$_LoginReqDTO) _then)
      : super(_value, (v) => _then(v as _$_LoginReqDTO));

  @override
  _$_LoginReqDTO get _value => super._value as _$_LoginReqDTO;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? verificationCode = freezed,
    Object? fcmToken = freezed,
  }) {
    return _then(_$_LoginReqDTO(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      verificationCode: verificationCode == freezed
          ? _value.verificationCode
          : verificationCode // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: fcmToken == freezed
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoginReqDTO implements _LoginReqDTO {
  const _$_LoginReqDTO(
      {required this.phoneNumber,
      required this.verificationCode,
      required this.fcmToken});

  factory _$_LoginReqDTO.fromJson(Map<String, dynamic> json) =>
      _$$_LoginReqDTOFromJson(json);

  @override
  final String phoneNumber;
  @override
  final String verificationCode;
  @override
  final String fcmToken;

  @override
  String toString() {
    return 'LoginReqDTO(phoneNumber: $phoneNumber, verificationCode: $verificationCode, fcmToken: $fcmToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginReqDTO &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality()
                .equals(other.verificationCode, verificationCode) &&
            const DeepCollectionEquality().equals(other.fcmToken, fcmToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(verificationCode),
      const DeepCollectionEquality().hash(fcmToken));

  @JsonKey(ignore: true)
  @override
  _$$_LoginReqDTOCopyWith<_$_LoginReqDTO> get copyWith =>
      __$$_LoginReqDTOCopyWithImpl<_$_LoginReqDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginReqDTOToJson(this);
  }
}

abstract class _LoginReqDTO implements LoginReqDTO {
  const factory _LoginReqDTO(
      {required final String phoneNumber,
      required final String verificationCode,
      required final String fcmToken}) = _$_LoginReqDTO;

  factory _LoginReqDTO.fromJson(Map<String, dynamic> json) =
      _$_LoginReqDTO.fromJson;

  @override
  String get phoneNumber => throw _privateConstructorUsedError;
  @override
  String get verificationCode => throw _privateConstructorUsedError;
  @override
  String get fcmToken => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LoginReqDTOCopyWith<_$_LoginReqDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
