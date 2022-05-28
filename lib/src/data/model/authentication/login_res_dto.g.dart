// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_res_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginResDTO _$$_LoginResDTOFromJson(Map<String, dynamic> json) =>
    _$_LoginResDTO(
      account: User.fromJson(json['account'] as Map<String, dynamic>),
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$$_LoginResDTOToJson(_$_LoginResDTO instance) =>
    <String, dynamic>{
      'account': instance.account,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
