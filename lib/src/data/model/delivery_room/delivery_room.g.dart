// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeliveryRoom _$$_DeliveryRoomFromJson(Map<String, dynamic> json) =>
    _$_DeliveryRoom(
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
      'leader': instance.leader,
      'content': instance.content,
      'limitPerson': instance.limitPerson,
      'shareStoreLink': instance.shareStoreLink,
      'linkPlatformType': instance.linkPlatformType,
      'status': instance.status,
      'createdDate': instance.createdDate.toIso8601String(),
      'receivingLocation': instance.receivingLocation,
    };

_$_Leader _$$_LeaderFromJson(Map<String, dynamic> json) => _$_Leader(
      nickname: json['nickname'] as String,
      mannerScore: (json['mannerScore'] as num).toDouble(),
    );

Map<String, dynamic> _$$_LeaderToJson(_$_Leader instance) => <String, dynamic>{
      'nickname': instance.nickname,
      'mannerScore': instance.mannerScore,
    };

_$_ReceivingLocation _$$_ReceivingLocationFromJson(Map<String, dynamic> json) =>
    _$_ReceivingLocation(
      description: json['description'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$_ReceivingLocationToJson(
        _$_ReceivingLocation instance) =>
    <String, dynamic>{
      'description': instance.description,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
