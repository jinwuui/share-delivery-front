// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      accountId: json['accountId'] as int,
      phoneNumber: json['phoneNumber'] as String,
      nickname: json['nickname'] as String,
      profileImage: json['profileImage'] as String? ?? "",
      status: json['status'] as String,
      role: json['role'] as String,
      email: json['email'] as String?,
      bankAccount: json['bankAccount'] == null
          ? null
          : BankAccount.fromJson(json['bankAccount'] as Map<String, dynamic>),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'accountId': instance.accountId,
      'phoneNumber': instance.phoneNumber,
      'nickname': instance.nickname,
      'profileImage': instance.profileImage,
      'status': instance.status,
      'role': instance.role,
      'email': instance.email,
      'bankAccount': instance.bankAccount,
      'createdDate': instance.createdDate?.toIso8601String(),
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
    };

_$_BankAccount _$$_BankAccountFromJson(Map<String, dynamic> json) =>
    _$_BankAccount(
      accountHolder: json['accountHolder'] as String,
      bank: json['bank'] as String,
      accountNumber: json['accountNumber'] as String,
    );

Map<String, dynamic> _$$_BankAccountToJson(_$_BankAccount instance) =>
    <String, dynamic>{
      'accountHolder': instance.accountHolder,
      'bank': instance.bank,
      'accountNumber': instance.accountNumber,
    };
