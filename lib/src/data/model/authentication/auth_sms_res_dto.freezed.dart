// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_sms_res_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthSmsResDTO _$AuthSmsResDTOFromJson(Map<String, dynamic> json) {
  return _AuthSmsResDTO.fromJson(json);
}

/// @nodoc
mixin _$AuthSmsResDTO {
  String get requestId => throw _privateConstructorUsedError;
  String get statusCode => throw _privateConstructorUsedError;
  String get statusName => throw _privateConstructorUsedError;
  DateTime get requestTime => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get verificationType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthSmsResDTOCopyWith<AuthSmsResDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthSmsResDTOCopyWith<$Res> {
  factory $AuthSmsResDTOCopyWith(
          AuthSmsResDTO value, $Res Function(AuthSmsResDTO) then) =
      _$AuthSmsResDTOCopyWithImpl<$Res>;
  $Res call(
      {String requestId,
      String statusCode,
      String statusName,
      DateTime requestTime,
      String phoneNumber,
      String verificationType});
}

/// @nodoc
class _$AuthSmsResDTOCopyWithImpl<$Res>
    implements $AuthSmsResDTOCopyWith<$Res> {
  _$AuthSmsResDTOCopyWithImpl(this._value, this._then);

  final AuthSmsResDTO _value;
  // ignore: unused_field
  final $Res Function(AuthSmsResDTO) _then;

  @override
  $Res call({
    Object? requestId = freezed,
    Object? statusCode = freezed,
    Object? statusName = freezed,
    Object? requestTime = freezed,
    Object? phoneNumber = freezed,
    Object? verificationType = freezed,
  }) {
    return _then(_value.copyWith(
      requestId: requestId == freezed
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String,
      statusName: statusName == freezed
          ? _value.statusName
          : statusName // ignore: cast_nullable_to_non_nullable
              as String,
      requestTime: requestTime == freezed
          ? _value.requestTime
          : requestTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      verificationType: verificationType == freezed
          ? _value.verificationType
          : verificationType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_AuthSmsResDTOCopyWith<$Res>
    implements $AuthSmsResDTOCopyWith<$Res> {
  factory _$$_AuthSmsResDTOCopyWith(
          _$_AuthSmsResDTO value, $Res Function(_$_AuthSmsResDTO) then) =
      __$$_AuthSmsResDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {String requestId,
      String statusCode,
      String statusName,
      DateTime requestTime,
      String phoneNumber,
      String verificationType});
}

/// @nodoc
class __$$_AuthSmsResDTOCopyWithImpl<$Res>
    extends _$AuthSmsResDTOCopyWithImpl<$Res>
    implements _$$_AuthSmsResDTOCopyWith<$Res> {
  __$$_AuthSmsResDTOCopyWithImpl(
      _$_AuthSmsResDTO _value, $Res Function(_$_AuthSmsResDTO) _then)
      : super(_value, (v) => _then(v as _$_AuthSmsResDTO));

  @override
  _$_AuthSmsResDTO get _value => super._value as _$_AuthSmsResDTO;

  @override
  $Res call({
    Object? requestId = freezed,
    Object? statusCode = freezed,
    Object? statusName = freezed,
    Object? requestTime = freezed,
    Object? phoneNumber = freezed,
    Object? verificationType = freezed,
  }) {
    return _then(_$_AuthSmsResDTO(
      requestId: requestId == freezed
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String,
      statusName: statusName == freezed
          ? _value.statusName
          : statusName // ignore: cast_nullable_to_non_nullable
              as String,
      requestTime: requestTime == freezed
          ? _value.requestTime
          : requestTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      verificationType: verificationType == freezed
          ? _value.verificationType
          : verificationType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthSmsResDTO implements _AuthSmsResDTO {
  const _$_AuthSmsResDTO(
      {required this.requestId,
      required this.statusCode,
      required this.statusName,
      required this.requestTime,
      required this.phoneNumber,
      required this.verificationType});

  factory _$_AuthSmsResDTO.fromJson(Map<String, dynamic> json) =>
      _$$_AuthSmsResDTOFromJson(json);

  @override
  final String requestId;
  @override
  final String statusCode;
  @override
  final String statusName;
  @override
  final DateTime requestTime;
  @override
  final String phoneNumber;
  @override
  final String verificationType;

  @override
  String toString() {
    return 'AuthSmsResDTO(requestId: $requestId, statusCode: $statusCode, statusName: $statusName, requestTime: $requestTime, phoneNumber: $phoneNumber, verificationType: $verificationType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthSmsResDTO &&
            const DeepCollectionEquality().equals(other.requestId, requestId) &&
            const DeepCollectionEquality()
                .equals(other.statusCode, statusCode) &&
            const DeepCollectionEquality()
                .equals(other.statusName, statusName) &&
            const DeepCollectionEquality()
                .equals(other.requestTime, requestTime) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality()
                .equals(other.verificationType, verificationType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(requestId),
      const DeepCollectionEquality().hash(statusCode),
      const DeepCollectionEquality().hash(statusName),
      const DeepCollectionEquality().hash(requestTime),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(verificationType));

  @JsonKey(ignore: true)
  @override
  _$$_AuthSmsResDTOCopyWith<_$_AuthSmsResDTO> get copyWith =>
      __$$_AuthSmsResDTOCopyWithImpl<_$_AuthSmsResDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthSmsResDTOToJson(this);
  }
}

abstract class _AuthSmsResDTO implements AuthSmsResDTO {
  const factory _AuthSmsResDTO(
      {required final String requestId,
      required final String statusCode,
      required final String statusName,
      required final DateTime requestTime,
      required final String phoneNumber,
      required final String verificationType}) = _$_AuthSmsResDTO;

  factory _AuthSmsResDTO.fromJson(Map<String, dynamic> json) =
      _$_AuthSmsResDTO.fromJson;

  @override
  String get requestId => throw _privateConstructorUsedError;
  @override
  String get statusCode => throw _privateConstructorUsedError;
  @override
  String get statusName => throw _privateConstructorUsedError;
  @override
  DateTime get requestTime => throw _privateConstructorUsedError;
  @override
  String get phoneNumber => throw _privateConstructorUsedError;
  @override
  String get verificationType => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AuthSmsResDTOCopyWith<_$_AuthSmsResDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
