import 'package:get/get.dart';
import 'package:share_delivery/src/controller/delivery_room_register/pick_receiving_location_controller.dart';
import 'package:share_delivery/src/data/repository/delivery_room_register/pick_receiving_location_repository.dart';

class PickReceivingLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PickReceivingLocationController(
        repository: PickReceivingLocationRepository(),
      ),
    );
  }
}
