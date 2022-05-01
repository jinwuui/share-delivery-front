// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeliveryRoom _$$_DeliveryRoomFromJson(Map<String, dynamic> json) =>
    _$_DeliveryRoom(
      leader: Leader.fromJson(json['leader'] as Map<String, dynamic>),
      leaderNickname: json['leaderNickname'] as String,
      leaderMannerScore: (json['leaderMannerScore'] as num).toDouble(),
      content: json['content'] as String,
      limitPerson: json['limitPerson'] as String,
      shareStoreLink: json['shareStoreLink'] as String,
      linkPlatformType: json['linkPlatformType'] as String,
      status: json['status'] as String,
      createdDate: DateTime.parse(json['createdDate'] as String),
      receivingLocation: ReceivingLocation.fromJson(
          json['receivingLocation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DeliveryRoomToJson(_$_DeliveryRoom instance) =>
    <String, dynamic>{
      'leader': instance.leader,
      'leaderNickname': instance.leaderNickname,
      'leaderMannerScore': instance.leaderMannerScore,
      'content': instance.content,
      'limitPerson': instance.limitPerson,
      'shareStoreLink': instance.shareStoreLink,
      'linkPlatformType': instance.linkPlatformType,
      'status': instance.status,
      'createdDate': instance.createdDate.toIso8601String(),
      'receivingLocation': instance.receivingLocation,
    };
