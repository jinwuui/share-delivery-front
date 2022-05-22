import 'package:get/get.dart';
import 'package:share_delivery/src/controller/delivery_room_register/delivery_room_register_controller.dart';
import 'package:share_delivery/src/controller/delivery_room_register/writing_menu_controller.dart';
import 'package:share_delivery/src/data/provider/delivery_room_register/delivery_room_register_api_client.dart';
import 'package:share_delivery/src/data/repository/delivery_room_register/delivery_room_register_repository.dart';

class DeliveryRoomRegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(WritingMenuController());

    Get.put(
      DeliveryRoomRegisterController(
        writingMenuController: Get.find<WritingMenuController>(),
        repository: DeliveryRoomRegisterRepository(
          apiClient: DeliveryRoomRegisterApiClient(),
        ),
      ),
    );
  }
}
