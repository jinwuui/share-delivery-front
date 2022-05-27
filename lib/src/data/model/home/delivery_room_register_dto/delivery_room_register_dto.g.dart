// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_room_register_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeliveryRoomRegisterDTO _$$_DeliveryRoomRegisterDTOFromJson(
        Map<String, dynamic> json) =>
    _$_DeliveryRoomRegisterDTO(
      content: json['content'] as String,
      deliveryTip: json['deliveryTip'] as int,
      limitPerson: json['limitPerson'] as int,
      menuList: (json['menuList'] as List<dynamic>?)
              ?.map((e) => Menu.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      receivingLocationId: json['receivingLocationId'] as int,
      shareStore:
          ShareStore.fromJson(json['shareStore'] as Map<String, dynamic>),
      storeCategory: json['storeCategory'] as String,
    );

Map<String, dynamic> _$$_DeliveryRoomRegisterDTOToJson(
        _$_DeliveryRoomRegisterDTO instance) =>
    <String, dynamic>{
      'content': instance.content,
      'deliveryTip': instance.deliveryTip,
      'limitPerson': instance.limitPerson,
      'menuList': instance.menuList,
      'receivingLocationId': instance.receivingLocationId,
      'shareStore': instance.shareStore,
      'storeCategory': instance.storeCategory,
    };

_$_ShareStore _$$_ShareStoreFromJson(Map<String, dynamic> json) =>
    _$_ShareStore(
      link: json['link'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$_ShareStoreToJson(_$_ShareStore instance) =>
    <String, dynamic>{
      'link': instance.link,
      'name': instance.name,
      'type': instance.type,
    };
