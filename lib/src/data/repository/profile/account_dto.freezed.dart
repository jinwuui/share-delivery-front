// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'account_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountDTO _$AccountDTOFromJson(Map<String, dynamic> json) {
  return _AccountDTO.fromJson(json);
}

/// @nodoc
mixin _$AccountDTO {
  int get userId => throw _privateConstructorUsedError;
  String get bank => throw _privateConstructorUsedError;
  String get accountNumber => throw _privateConstructorUsedError;
  String get accountHolder => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountDTOCopyWith<AccountDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountDTOCopyWith<$Res> {
  factory $AccountDTOCopyWith(
          AccountDTO value, $Res Function(AccountDTO) then) =
      _$AccountDTOCopyWithImpl<$Res>;
  $Res call(
      {int userId, String bank, String accountNumber, String accountHolder});
}

/// @nodoc
class _$AccountDTOCopyWithImpl<$Res> implements $AccountDTOCopyWith<$Res> {
  _$AccountDTOCopyWithImpl(this._value, this._then);

  final AccountDTO _value;
  // ignore: unused_field
  final $Res Function(AccountDTO) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? bank = freezed,
    Object? accountNumber = freezed,
    Object? accountHolder = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      bank: bank == freezed
          ? _value.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as String,
      accountNumber: accountNumber == freezed
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      accountHolder: accountHolder == freezed
          ? _value.accountHolder
          : accountHolder // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_AccountDTOCopyWith<$Res>
    implements $AccountDTOCopyWith<$Res> {
  factory _$$_AccountDTOCopyWith(
          _$_AccountDTO value, $Res Function(_$_AccountDTO) then) =
      __$$_AccountDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {int userId, String bank, String accountNumber, String accountHolder});
}

/// @nodoc
class __$$_AccountDTOCopyWithImpl<$Res> extends _$AccountDTOCopyWithImpl<$Res>
    implements _$$_AccountDTOCopyWith<$Res> {
  __$$_AccountDTOCopyWithImpl(
      _$_AccountDTO _value, $Res Function(_$_AccountDTO) _then)
      : super(_value, (v) => _then(v as _$_AccountDTO));

  @override
  _$_AccountDTO get _value => super._value as _$_AccountDTO;

  @override
  $Res call({
    Object? userId = freezed,
    Object? bank = freezed,
    Object? accountNumber = freezed,
    Object? accountHolder = freezed,
  }) {
    return _then(_$_AccountDTO(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      bank: bank == freezed
          ? _value.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as String,
      accountNumber: accountNumber == freezed
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      accountHolder: accountHolder == freezed
          ? _value.accountHolder
          : accountHolder // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountDTO implements _AccountDTO {
  const _$_AccountDTO(
      {required this.userId,
      required this.bank,
      required this.accountNumber,
      required this.accountHolder});

  factory _$_AccountDTO.fromJson(Map<String, dynamic> json) =>
      _$$_AccountDTOFromJson(json);

  @override
  final int userId;
  @override
  final String bank;
  @override
  final String accountNumber;
  @override
  final String accountHolder;

  @override
  String toString() {
    return 'AccountDTO(userId: $userId, bank: $bank, accountNumber: $accountNumber, accountHolder: $accountHolder)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountDTO &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.bank, bank) &&
            const DeepCollectionEquality()
                .equals(other.accountNumber, accountNumber) &&
            const DeepCollectionEquality()
                .equals(other.accountHolder, accountHolder));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(bank),
      const DeepCollectionEquality().hash(accountNumber),
      const DeepCollectionEquality().hash(accountHolder));

  @JsonKey(ignore: true)
  @override
  _$$_AccountDTOCopyWith<_$_AccountDTO> get copyWith =>
      __$$_AccountDTOCopyWithImpl<_$_AccountDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountDTOToJson(this);
  }
}

abstract class _AccountDTO implements AccountDTO {
  const factory _AccountDTO(
      {required final int userId,
      required final String bank,
      required final String accountNumber,
      required final String accountHolder}) = _$_AccountDTO;

  factory _AccountDTO.fromJson(Map<String, dynamic> json) =
      _$_AccountDTO.fromJson;

  @override
  int get userId => throw _privateConstructorUsedError;
  @override
  String get bank => throw _privateConstructorUsedError;
  @override
  String get accountNumber => throw _privateConstructorUsedError;
  @override
  String get accountHolder => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AccountDTOCopyWith<_$_AccountDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
