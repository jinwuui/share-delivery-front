import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_room.freezed.dart';
part 'delivery_room.g.dart';

@Freezed()
class DeliveryRoom with _$DeliveryRoom {
  const factory DeliveryRoom({
    required Leader leader,
    required String content,
    required int limitPerson,
    required String shareStoreLink,
    required String linkPlatformType,
    required String status,
    required DateTime createdDate,
    required ReceivingLocation receivingLocation,
  }) = _DeliveryRoom;

  factory DeliveryRoom.fromJson(Map<String, dynamic> json) =>
      _$DeliveryRoomFromJson(json);
}

@Freezed()
class Leader with _$Leader {
  const factory Leader({
    required String nickname,
    required double mannerScore,
  }) = _Leader;

  factory Leader.fromJson(Map<String, dynamic> json) => _$LeaderFromJson(json);
}

@Freezed()
class ReceivingLocation with _$ReceivingLocation {
  const factory ReceivingLocation({
    required String description,
    required double latitude,
    required double longitude,
  }) = _ReceivingLocation;

  factory ReceivingLocation.fromJson(Map<String, dynamic> json) =>
      _$ReceivingLocationFromJson(json);
}
