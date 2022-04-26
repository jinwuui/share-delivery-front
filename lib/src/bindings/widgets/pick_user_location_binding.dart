import 'package:get/get.dart';
import 'package:share_delivery/src/controller/widgets/pick_user_location_controller.dart';

class PickUserLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PickUserLocationController());
  }
}
