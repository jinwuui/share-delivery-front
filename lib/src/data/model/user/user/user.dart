import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@Freezed()
class User with _$User {
  const factory User({
    required int accountId,
    required String phoneNumber,
    required String nickname,
    @Default("") String profileImage,
    required String status,
    required String role,
    String? email,
    BankAccount? bankAccount,
    DateTime? createdDate,
    DateTime? modifiedDate,
    @Default(36.5) double mannerScore,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@Freezed()
class BankAccount with _$BankAccount {
  const factory BankAccount({
    required String accountHolder,
    required String bank,
    required String accountNumber,
  }) = _BankAccount;

  factory BankAccount.fromJson(Map<String, dynamic> json) =>
      _$BankAccountFromJson(json);
}
