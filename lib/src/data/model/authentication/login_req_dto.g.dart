// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_req_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginReqDTO _$$_LoginReqDTOFromJson(Map<String, dynamic> json) =>
    _$_LoginReqDTO(
      phoneNumber: json['phoneNumber'] as String,
      verificationCode: json['verificationCode'] as String,
      fcmToken: json['fcmToken'] as String,
    );

Map<String, dynamic> _$$_LoginReqDTOToJson(_$_LoginReqDTO instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'verificationCode': instance.verificationCode,
      'fcmToken': instance.fcmToken,
    };
