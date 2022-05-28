import 'package:get/get.dart';
import 'package:share_delivery/src/data/model/delivery_room/delivery_room/delivery_room.dart';

class DeliveryManageController extends GetxService {
  final deliveryRooms = {}.obs; // key : roomId, value : DeliveryRoomModel

  Future<void> addDeliveryRoom(String roomId, DeliveryRoom deliveryRoom) async {
    deliveryRooms[roomId] = deliveryRoom;
  }

  Future<void> deleteDeliveryRoom(String roomId) async {
    deliveryRooms.remove(roomId);
  }
}
