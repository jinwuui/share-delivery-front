// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeliveryRoom _$$_DeliveryRoomFromJson(Map<String, dynamic> json) =>
    _$_DeliveryRoom(
      roomId: json['roomId'] as int? ?? -1,
      leader: Leader.fromJson(json['leader'] as Map<String, dynamic>),
      content: json['content'] as String,
      person: json['person'] as int,
      limitPerson: json['limitPerson'] as int,
      deliveryTip: json['deliveryTip'] as int,
      storeLink: json['storeLink'] as String,
      platformType: json['platformType'] as String,
      status: json['status'] as String,
      createdDateTime: DateTime.parse(json['createdDateTime'] as String),
      receivingLocation: ReceivingLocation.fromJson(
          json['receivingLocation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DeliveryRoomToJson(_$_DeliveryRoom instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'leader': instance.leader,
      'content': instance.content,
      'person': instance.person,
      'limitPerson': instance.limitPerson,
      'deliveryTip': instance.deliveryTip,
      'storeLink': instance.storeLink,
      'platformType': instance.platformType,
      'status': instance.status,
      'createdDateTime': instance.createdDateTime.toIso8601String(),
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
      id: json['id'] as int? ?? -1,
      description: json['description'] as String,
      address: json['address'] as String? ?? "dummy address",
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      isFavorite: json['isFavorite'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ReceivingLocationToJson(
        _$_ReceivingLocation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'address': instance.address,
      'lat': instance.lat,
      'lng': instance.lng,
      'isFavorite': instance.isFavorite,
    };
