// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeliveryHistoryModel _$$_DeliveryHistoryModelFromJson(
        Map<String, dynamic> json) =>
    _$_DeliveryHistoryModel(
      leaderName: json['leaderName'] as String,
      content: json['content'] as String,
      peopleNumber: json['peopleNumber'] as int,
      limitPerson: json['limitPerson'] as int,
      storeName: json['storeName'] as String,
      platformType: $enumDecode(_$PlatformTypeEnumMap, json['platformType']),
      status: $enumDecode(_$DeliveryRoomStatusEnumMap, json['status']),
      receivingLocationDesc: json['receivingLocationDesc'] as String,
      storeCategory: $enumDecode(_$StoreCategoryEnumMap, json['storeCategory']),
    );

Map<String, dynamic> _$$_DeliveryHistoryModelToJson(
        _$_DeliveryHistoryModel instance) =>
    <String, dynamic>{
      'leaderName': instance.leaderName,
      'content': instance.content,
      'peopleNumber': instance.peopleNumber,
      'limitPerson': instance.limitPerson,
      'storeName': instance.storeName,
      'platformType': _$PlatformTypeEnumMap[instance.platformType],
      'status': _$DeliveryRoomStatusEnumMap[instance.status],
      'receivingLocationDesc': instance.receivingLocationDesc,
      'storeCategory': _$StoreCategoryEnumMap[instance.storeCategory],
    };

const _$PlatformTypeEnumMap = {
  PlatformType.BAEMIN: 'BAEMIN',
  PlatformType.YOGIYO: 'YOGIYO',
};

const _$DeliveryRoomStatusEnumMap = {
  DeliveryRoomStatus.OPEN: 'OPEN',
  DeliveryRoomStatus.WAITING_PAYMENT: 'WAITING_PAYMENT',
  DeliveryRoomStatus.WAITING_DELIVERY: 'WAITING_DELIVERY',
  DeliveryRoomStatus.WAITING_REMITTANCE: 'WAITING_REMITTANCE',
  DeliveryRoomStatus.COMPLETED: 'COMPLETED',
};

const _$StoreCategoryEnumMap = {
  StoreCategory.CHICKEN: 'CHICKEN',
};
