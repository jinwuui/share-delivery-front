// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_up_req_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignUpReqDTO _$SignUpReqDTOFromJson(Map<String, dynamic> json) {
  return _SignUpReqDTO.fromJson(json);
}

/// @nodoc
mixin _$SignUpReqDTO {
  String get phoneNumber => throw _privateConstructorUsedError;
  String get verificationCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignUpReqDTOCopyWith<SignUpReqDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpReqDTOCopyWith<$Res> {
  factory $SignUpReqDTOCopyWith(
          SignUpReqDTO value, $Res Function(SignUpReqDTO) then) =
      _$SignUpReqDTOCopyWithImpl<$Res>;
  $Res call({String phoneNumber, String verificationCode});
}

/// @nodoc
class _$SignUpReqDTOCopyWithImpl<$Res> implements $SignUpReqDTOCopyWith<$Res> {
  _$SignUpReqDTOCopyWithImpl(this._value, this._then);

  final SignUpReqDTO _value;
  // ignore: unused_field
  final $Res Function(SignUpReqDTO) _then;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? verificationCode = freezed,
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
    ));
  }
}

/// @nodoc
abstract class _$$_SignUpReqDTOCopyWith<$Res>
    implements $SignUpReqDTOCopyWith<$Res> {
  factory _$$_SignUpReqDTOCopyWith(
          _$_SignUpReqDTO value, $Res Function(_$_SignUpReqDTO) then) =
      __$$_SignUpReqDTOCopyWithImpl<$Res>;
  @override
  $Res call({String phoneNumber, String verificationCode});
}

/// @nodoc
class __$$_SignUpReqDTOCopyWithImpl<$Res>
    extends _$SignUpReqDTOCopyWithImpl<$Res>
    implements _$$_SignUpReqDTOCopyWith<$Res> {
  __$$_SignUpReqDTOCopyWithImpl(
      _$_SignUpReqDTO _value, $Res Function(_$_SignUpReqDTO) _then)
      : super(_value, (v) => _then(v as _$_SignUpReqDTO));

  @override
  _$_SignUpReqDTO get _value => super._value as _$_SignUpReqDTO;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? verificationCode = freezed,
  }) {
    return _then(_$_SignUpReqDTO(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      verificationCode: verificationCode == freezed
          ? _value.verificationCode
          : verificationCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SignUpReqDTO implements _SignUpReqDTO {
  const _$_SignUpReqDTO(
      {required this.phoneNumber, required this.verificationCode});

  factory _$_SignUpReqDTO.fromJson(Map<String, dynamic> json) =>
      _$$_SignUpReqDTOFromJson(json);

  @override
  final String phoneNumber;
  @override
  final String verificationCode;

  @override
  String toString() {
    return 'SignUpReqDTO(phoneNumber: $phoneNumber, verificationCode: $verificationCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignUpReqDTO &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality()
                .equals(other.verificationCode, verificationCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(verificationCode));

  @JsonKey(ignore: true)
  @override
  _$$_SignUpReqDTOCopyWith<_$_SignUpReqDTO> get copyWith =>
      __$$_SignUpReqDTOCopyWithImpl<_$_SignUpReqDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignUpReqDTOToJson(this);
  }
}

abstract class _SignUpReqDTO implements SignUpReqDTO {
  const factory _SignUpReqDTO(
      {required final String phoneNumber,
      required final String verificationCode}) = _$_SignUpReqDTO;

  factory _SignUpReqDTO.fromJson(Map<String, dynamic> json) =
      _$_SignUpReqDTO.fromJson;

  @override
  String get phoneNumber => throw _privateConstructorUsedError;
  @override
  String get verificationCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SignUpReqDTOCopyWith<_$_SignUpReqDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
