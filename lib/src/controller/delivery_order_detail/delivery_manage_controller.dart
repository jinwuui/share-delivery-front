import 'package:get/get.dart';
import 'package:share_delivery/src/data/model/delivery_room/delivery_room/delivery_room.dart';
import 'package:logger/logger.dart';

class DeliveryManageController extends GetxService {
  static DeliveryManageController get to => Get.find();

  final deliveryRooms = {}.obs; // key : roomId, value : DeliveryRoomModel
  final deliveryRoomCountInProgress = 0.obs;

  Future<void> addDeliveryRoom(int roomId, DeliveryRoom deliveryRoom) async {
    Logger().w("addDeliveryRoom");
    deliveryRooms[roomId] = deliveryRoom;
    deliveryRoomCountInProgress.value += 1;
  }

  Future<void> deleteDeliveryRoom(int roomId) async {
    deliveryRooms.remove(roomId);
    deliveryRoomCountInProgress.value -= 1;
  }
}
