import 'package:get/get.dart';
import 'package:share_delivery/src/controller/delivery_history/delivery_history_controller.dart';
import 'package:share_delivery/src/data/repository/delivery_history/delivery_history_repository.dart';

class DeliveryHistoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<DeliveryHistoryController>(DeliveryHistoryController(
      deliveryHistoryRepository: DeliveryHistoryRepository(),
    ));
  }
}
