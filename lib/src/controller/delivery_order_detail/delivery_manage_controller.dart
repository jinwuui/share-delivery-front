import 'package:get/get.dart';
import 'package:share_delivery/src/data/model/delivery_room/delivery_room/delivery_room.dart';

class DeliveryManageController extends GetxService {
  static DeliveryManageController get to => Get.find();

  final deliveryRooms = {}.obs; // key : roomId, value : DeliveryRoomModel

  Future<void> addDeliveryRoom(int roomId, DeliveryRoom deliveryRoom) async {
    deliveryRooms[roomId] = deliveryRoom;
  }

  Future<void> deleteDeliveryRoom(int roomId) async {
    deliveryRooms.remove(roomId);
  }
}
