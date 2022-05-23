// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeliveryRoom _$$_DeliveryRoomFromJson(Map<String, dynamic> json) =>
    _$_DeliveryRoom(
      deliveryRoomId: json['deliveryRoomId'] as String,
      leader: Leader.fromJson(json['leader'] as Map<String, dynamic>),
      content: json['content'] as String,
      limitPerson: json['limitPerson'] as int,
      shareStoreLink: json['shareStoreLink'] as String,
      linkPlatformType: json['linkPlatformType'] as String,
      status: json['status'] as String,
      createdDate: DateTime.parse(json['createdDate'] as String),
      receivingLocation: ReceivingLocation.fromJson(
          json['receivingLocation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DeliveryRoomToJson(_$_DeliveryRoom instance) =>
    <String, dynamic>{
      'deliveryRoomId': instance.deliveryRoomId,
      'leader': instance.leader,
      'content': instance.content,
      'limitPerson': instance.limitPerson,
      'shareStoreLink': instance.shareStoreLink,
      'linkPlatformType': instance.linkPlatformType,
      'status': instance.status,
      'createdDate': instance.createdDate.toIso8601String(),
      'receivingLocation': instance.receivingLocation,
    };
