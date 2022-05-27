// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      accountId: json['accountId'] as int,
      phoneNumber: json['phoneNumber'] as String,
      nickname: json['nickname'] as String,
      status: json['status'] as String,
      profileImage: json['profileImage'] as String? ?? "",
      email: json['email'] as String?,
      bank: json['bank'] as String?,
      accounts: json['accounts'] as String?,
      userName: json['userName'] as String?,
      joinDate: json['joinDate'] == null
          ? null
          : DateTime.parse(json['joinDate'] as String),
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
      withdrawDate: json['withdrawDate'] == null
          ? null
          : DateTime.parse(json['withdrawDate'] as String),
      recentDate: json['recentDate'] == null
          ? null
          : DateTime.parse(json['recentDate'] as String),
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'accountId': instance.accountId,
      'phoneNumber': instance.phoneNumber,
      'nickname': instance.nickname,
      'status': instance.status,
      'profileImage': instance.profileImage,
      'email': instance.email,
      'bank': instance.bank,
      'accounts': instance.accounts,
      'userName': instance.userName,
      'joinDate': instance.joinDate?.toIso8601String(),
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'withdrawDate': instance.withdrawDate?.toIso8601String(),
      'recentDate': instance.recentDate?.toIso8601String(),
    };
