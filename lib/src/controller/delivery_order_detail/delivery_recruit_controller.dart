import 'package:get/get.dart';

class DeliveryRecruitController extends GetxController {
  DeliveryRecruitController();

  final deliveryOrderStatus = RxString('initial');

  get status => deliveryOrderStatus;
  set status(value) => deliveryOrderStatus.value = value;

  changeStatus(value) {
    print("change");
    deliveryOrderStatus.value = value;
  }

  @override
  void onInit() {
    print("Delivery Order Controller INit");
    super.onInit();
  }
}
