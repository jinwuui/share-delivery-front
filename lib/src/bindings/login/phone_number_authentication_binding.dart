import 'package:get/get.dart';
import 'package:share_delivery/src/controller/login/login_controller.dart';

class PhoneNumberAuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
