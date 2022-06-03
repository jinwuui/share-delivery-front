import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'delivery_room.freezed.dart';
part 'delivery_room.g.dart';

@Freezed()
class DeliveryRoom with _$DeliveryRoom {
  const factory DeliveryRoom({
    @Default(-1) int roomId,
    required Leader leader,
    required String content,
    required int person,
    required int limitPerson,
    required int deliveryTip,
    required String storeLink,
    required String platformType,
    required String status,
    required DateTime createdDateTime,
    @Default("DummyStoreCategory") String storeCategory,
    required ReceivingLocation receivingLocation,
  }) = _DeliveryRoom;

  factory DeliveryRoom.fromJson(Map<String, dynamic> json) =>
      _$DeliveryRoomFromJson(json);
}

@Freezed()
class Leader with _$Leader {
  const factory Leader({
    required int accountId,
    required String nickname,
    required double mannerScore,
  }) = _Leader;

  factory Leader.fromJson(Map<String, dynamic> json) => _$LeaderFromJson(json);
}

@Freezed()
class ReceivingLocation with _$ReceivingLocation {
  const factory ReceivingLocation({
    @Default(-1) int id,
    required String description,
    @Default("dummy address") String address,
    required double latitude,
    required double longitude,
    @Default(false) bool isFavorite,
  }) = _ReceivingLocation;

  factory ReceivingLocation.fromJson(Map<String, dynamic> json) =>
      _$ReceivingLocationFromJson(json);
}
