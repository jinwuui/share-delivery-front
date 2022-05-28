// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  int get accountId => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  String get profileImage => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  BankAccount? get bankAccount => throw _privateConstructorUsedError;
  DateTime? get createdDate => throw _privateConstructorUsedError;
  DateTime? get modifiedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {int accountId,
      String phoneNumber,
      String nickname,
      String profileImage,
      String status,
      String role,
      String? email,
      BankAccount? bankAccount,
      DateTime? createdDate,
      DateTime? modifiedDate});

  $BankAccountCopyWith<$Res>? get bankAccount;
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? accountId = freezed,
    Object? phoneNumber = freezed,
    Object? nickname = freezed,
    Object? profileImage = freezed,
    Object? status = freezed,
    Object? role = freezed,
    Object? email = freezed,
    Object? bankAccount = freezed,
    Object? createdDate = freezed,
    Object? modifiedDate = freezed,
  }) {
    return _then(_value.copyWith(
      accountId: accountId == freezed
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: nickname == freezed
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: profileImage == freezed
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      bankAccount: bankAccount == freezed
          ? _value.bankAccount
          : bankAccount // ignore: cast_nullable_to_non_nullable
              as BankAccount?,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedDate: modifiedDate == freezed
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  @override
  $BankAccountCopyWith<$Res>? get bankAccount {
    if (_value.bankAccount == null) {
      return null;
    }

    return $BankAccountCopyWith<$Res>(_value.bankAccount!, (value) {
      return _then(_value.copyWith(bankAccount: value));
    });
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {int accountId,
      String phoneNumber,
      String nickname,
      String profileImage,
      String status,
      String role,
      String? email,
      BankAccount? bankAccount,
      DateTime? createdDate,
      DateTime? modifiedDate});

  @override
  $BankAccountCopyWith<$Res>? get bankAccount;
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, (v) => _then(v as _$_User));

  @override
  _$_User get _value => super._value as _$_User;

  @override
  $Res call({
    Object? accountId = freezed,
    Object? phoneNumber = freezed,
    Object? nickname = freezed,
    Object? profileImage = freezed,
    Object? status = freezed,
    Object? role = freezed,
    Object? email = freezed,
    Object? bankAccount = freezed,
    Object? createdDate = freezed,
    Object? modifiedDate = freezed,
  }) {
    return _then(_$_User(
      accountId: accountId == freezed
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: nickname == freezed
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: profileImage == freezed
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      bankAccount: bankAccount == freezed
          ? _value.bankAccount
          : bankAccount // ignore: cast_nullable_to_non_nullable
              as BankAccount?,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedDate: modifiedDate == freezed
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  const _$_User(
      {required this.accountId,
      required this.phoneNumber,
      required this.nickname,
      this.profileImage = "",
      required this.status,
      required this.role,
      this.email,
      this.bankAccount,
      this.createdDate,
      this.modifiedDate});

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final int accountId;
  @override
  final String phoneNumber;
  @override
  final String nickname;
  @override
  @JsonKey()
  final String profileImage;
  @override
  final String status;
  @override
  final String role;
  @override
  final String? email;
  @override
  final BankAccount? bankAccount;
  @override
  final DateTime? createdDate;
  @override
  final DateTime? modifiedDate;

  @override
  String toString() {
    return 'User(accountId: $accountId, phoneNumber: $phoneNumber, nickname: $nickname, profileImage: $profileImage, status: $status, role: $role, email: $email, bankAccount: $bankAccount, createdDate: $createdDate, modifiedDate: $modifiedDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            const DeepCollectionEquality().equals(other.accountId, accountId) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.nickname, nickname) &&
            const DeepCollectionEquality()
                .equals(other.profileImage, profileImage) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.role, role) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality()
                .equals(other.bankAccount, bankAccount) &&
            const DeepCollectionEquality()
                .equals(other.createdDate, createdDate) &&
            const DeepCollectionEquality()
                .equals(other.modifiedDate, modifiedDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(accountId),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(nickname),
      const DeepCollectionEquality().hash(profileImage),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(role),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(bankAccount),
      const DeepCollectionEquality().hash(createdDate),
      const DeepCollectionEquality().hash(modifiedDate));

  @JsonKey(ignore: true)
  @override
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(this);
  }
}

abstract class _User implements User {
  const factory _User(
      {required final int accountId,
      required final String phoneNumber,
      required final String nickname,
      final String profileImage,
      required final String status,
      required final String role,
      final String? email,
      final BankAccount? bankAccount,
      final DateTime? createdDate,
      final DateTime? modifiedDate}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  int get accountId => throw _privateConstructorUsedError;
  @override
  String get phoneNumber => throw _privateConstructorUsedError;
  @override
  String get nickname => throw _privateConstructorUsedError;
  @override
  String get profileImage => throw _privateConstructorUsedError;
  @override
  String get status => throw _privateConstructorUsedError;
  @override
  String get role => throw _privateConstructorUsedError;
  @override
  String? get email => throw _privateConstructorUsedError;
  @override
  BankAccount? get bankAccount => throw _privateConstructorUsedError;
  @override
  DateTime? get createdDate => throw _privateConstructorUsedError;
  @override
  DateTime? get modifiedDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}

BankAccount _$BankAccountFromJson(Map<String, dynamic> json) {
  return _BankAccount.fromJson(json);
}

/// @nodoc
mixin _$BankAccount {
  String get accountHolder => throw _privateConstructorUsedError;
  String get bank => throw _privateConstructorUsedError;
  String get accountNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BankAccountCopyWith<BankAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankAccountCopyWith<$Res> {
  factory $BankAccountCopyWith(
          BankAccount value, $Res Function(BankAccount) then) =
      _$BankAccountCopyWithImpl<$Res>;
  $Res call({String accountHolder, String bank, String accountNumber});
}

/// @nodoc
class _$BankAccountCopyWithImpl<$Res> implements $BankAccountCopyWith<$Res> {
  _$BankAccountCopyWithImpl(this._value, this._then);

  final BankAccount _value;
  // ignore: unused_field
  final $Res Function(BankAccount) _then;

  @override
  $Res call({
    Object? accountHolder = freezed,
    Object? bank = freezed,
    Object? accountNumber = freezed,
  }) {
    return _then(_value.copyWith(
      accountHolder: accountHolder == freezed
          ? _value.accountHolder
          : accountHolder // ignore: cast_nullable_to_non_nullable
              as String,
      bank: bank == freezed
          ? _value.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as String,
      accountNumber: accountNumber == freezed
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_BankAccountCopyWith<$Res>
    implements $BankAccountCopyWith<$Res> {
  factory _$$_BankAccountCopyWith(
          _$_BankAccount value, $Res Function(_$_BankAccount) then) =
      __$$_BankAccountCopyWithImpl<$Res>;
  @override
  $Res call({String accountHolder, String bank, String accountNumber});
}

/// @nodoc
class __$$_BankAccountCopyWithImpl<$Res> extends _$BankAccountCopyWithImpl<$Res>
    implements _$$_BankAccountCopyWith<$Res> {
  __$$_BankAccountCopyWithImpl(
      _$_BankAccount _value, $Res Function(_$_BankAccount) _then)
      : super(_value, (v) => _then(v as _$_BankAccount));

  @override
  _$_BankAccount get _value => super._value as _$_BankAccount;

  @override
  $Res call({
    Object? accountHolder = freezed,
    Object? bank = freezed,
    Object? accountNumber = freezed,
  }) {
    return _then(_$_BankAccount(
      accountHolder: accountHolder == freezed
          ? _value.accountHolder
          : accountHolder // ignore: cast_nullable_to_non_nullable
              as String,
      bank: bank == freezed
          ? _value.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as String,
      accountNumber: accountNumber == freezed
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BankAccount implements _BankAccount {
  const _$_BankAccount(
      {required this.accountHolder,
      required this.bank,
      required this.accountNumber});

  factory _$_BankAccount.fromJson(Map<String, dynamic> json) =>
      _$$_BankAccountFromJson(json);

  @override
  final String accountHolder;
  @override
  final String bank;
  @override
  final String accountNumber;

  @override
  String toString() {
    return 'BankAccount(accountHolder: $accountHolder, bank: $bank, accountNumber: $accountNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BankAccount &&
            const DeepCollectionEquality()
                .equals(other.accountHolder, accountHolder) &&
            const DeepCollectionEquality().equals(other.bank, bank) &&
            const DeepCollectionEquality()
                .equals(other.accountNumber, accountNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(accountHolder),
      const DeepCollectionEquality().hash(bank),
      const DeepCollectionEquality().hash(accountNumber));

  @JsonKey(ignore: true)
  @override
  _$$_BankAccountCopyWith<_$_BankAccount> get copyWith =>
      __$$_BankAccountCopyWithImpl<_$_BankAccount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BankAccountToJson(this);
  }
}

abstract class _BankAccount implements BankAccount {
  const factory _BankAccount(
      {required final String accountHolder,
      required final String bank,
      required final String accountNumber}) = _$_BankAccount;

  factory _BankAccount.fromJson(Map<String, dynamic> json) =
      _$_BankAccount.fromJson;

  @override
  String get accountHolder => throw _privateConstructorUsedError;
  @override
  String get bank => throw _privateConstructorUsedError;
  @override
  String get accountNumber => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_BankAccountCopyWith<_$_BankAccount> get copyWith =>
      throw _privateConstructorUsedError;
}
