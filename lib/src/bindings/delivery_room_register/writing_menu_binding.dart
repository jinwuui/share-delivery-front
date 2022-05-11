import 'package:get/get.dart';
import 'package:share_delivery/src/controller/delivery_room_register/writing_menu_controller.dart';

class WritingMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      WritingMenuController(),
    );
  }
}
