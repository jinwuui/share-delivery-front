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
      email: json['email'] as String? ?? "",
      status: json['status'] as String,
      role: json['role'] as String,
      bankAccount: json['bankAccount'] as String? ?? "",
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'accountId': instance.accountId,
      'phoneNumber': instance.phoneNumber,
      'nickname': instance.nickname,
      'profileImage': instance.profileImage,
      'email': instance.email,
      'status': instance.status,
      'role': instance.role,
      'bankAccount': instance.bankAccount,
    };
