import 'package:get/get.dart';
import 'package:share_delivery/src/controller/root_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RootController());
  }
}
