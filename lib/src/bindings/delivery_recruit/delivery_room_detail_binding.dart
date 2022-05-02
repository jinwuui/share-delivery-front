import 'package:get/get.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_order_controller.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_recruit_controller.dart';

class DeliveryRoomDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DeliveryRecruitController());
    Get.put(DeliveryOrderController());
  }
}
