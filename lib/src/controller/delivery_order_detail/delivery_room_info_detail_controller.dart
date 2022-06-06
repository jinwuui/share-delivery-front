import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_order_controller.dart';
import 'package:share_delivery/src/controller/receiving_location/receiving_location_controller.dart';
import 'package:share_delivery/src/data/model/delivery_room/delivery_room/delivery_room.dart';
import 'package:share_delivery/src/data/repository/delivery_order_detail/delivery_order_detail_repository.dart';
import 'package:share_delivery/src/services/delivery_room_manage_service.dart';

class DeliveryRoomInfoDetailController extends GetxController {
  final DeliveryOrderDetailRepository repository;

  static DeliveryRoomInfoDetailController get to => Get.find();
  DeliveryRoomInfoDetailController({required this.repository});

  final roomId = 0.obs;
  late final DeliveryRoom deliveryRoom;
  final isLoad = false.obs;

  @override
  void onInit() async {
    super.onInit();

    roomId.value = Get.arguments['deliveryRoomId'];
    await getDeliveryRoomInfo();
  }

  Future<void> getDeliveryRoomInfo() async {
    try {
      deliveryRoom = await repository.getDeliveryRoomInfoDetail(roomId.value);
      await ReceivingLocationController.to.refreshLocation();
      final status = deliveryRoom.status;
      DeliveryRoomState roomState = DeliveryRoomState.values
          .firstWhere((e) => e.toString() == 'DeliveryRoomState.' + status);
      await DeliveryOrderController.to.changeStatus(roomState);
      isLoad.value = true;
    } catch (e) {
      print(e);
    }
  }
}
