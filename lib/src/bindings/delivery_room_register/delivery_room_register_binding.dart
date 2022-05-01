import 'package:get/get.dart';
import 'package:share_delivery/src/controller/delivery_room_register/delivery_room_register_controller.dart';
import 'package:share_delivery/src/data/repository/delivery_room_register_repository.dart';

class DeliveryRoomRegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      DeliveryRoomRegisterController(
        repository: DeliveryRoomRegisterRepository(),
      ),
    );
  }
}
