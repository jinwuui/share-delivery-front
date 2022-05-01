import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:share_delivery/src/data/model/delivery_room/leader.dart';
import 'package:share_delivery/src/data/model/delivery_room/receiving_location.dart';

part 'delivery_room.freezed.dart';
part 'delivery_room.g.dart';

@Freezed()
class DeliveryRoom with _$DeliveryRoom {
  const factory DeliveryRoom({
    required Leader leader,
    required String leaderNickname,
    required double leaderMannerScore,
    required String content,
    required String limitPerson,
    required String shareStoreLink,
    required String linkPlatformType,
    required String status,
    required DateTime createdDate,
    required ReceivingLocation receivingLocation,
  }) = _DeliveryRoom;

  factory DeliveryRoom.fromJson(Map<String, dynamic> json) =>
      _$DeliveryRoomFromJson(json);
}
