// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountDTO _$$_AccountDTOFromJson(Map<String, dynamic> json) =>
    _$_AccountDTO(
      userId: json['userId'] as int,
      bank: json['bank'] as String,
      accountNumber: json['accountNumber'] as String,
      accountHolder: json['accountHolder'] as String,
    );

Map<String, dynamic> _$$_AccountDTOToJson(_$_AccountDTO instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'bank': instance.bank,
      'accountNumber': instance.accountNumber,
      'accountHolder': instance.accountHolder,
    };
