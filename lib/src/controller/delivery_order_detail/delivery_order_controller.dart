import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_room_info_detail_controller.dart';
import 'package:share_delivery/src/services/delivery_room_manage_service.dart';

class DeliveryOrderController extends FullLifeCycleController
    with FullLifeCycleMixin {
  static DeliveryOrderController get to => Get.find();

  DeliveryOrderController();

  final deliveryOrderStatus = DeliveryRoomState.OPEN.obs;
  final refreshPage = false.obs;

  get status => deliveryOrderStatus;
  set status(value) => deliveryOrderStatus.value = value;

  Future<void> changeStatus(DeliveryRoomState value) async {
    Logger().d("changeStatus", value);

    deliveryOrderStatus.value = value;
  }

  @override
  void onInit() {
    super.onInit();
  }

  // Mandatory 뭐지이건
  @override
  void onDetached() {
    Logger().d('Delivery Order Controller - onDetached called');
  }

  // Mandatory 처음 활성화
  @override
  void onInactive() {
    Logger().d('Delivery Order Controller - onInative called');

    // fetchDeliveryOrderDetail();
  }

  // Mandatory 백그라운드
  @override
  void onPaused() {
    Logger().d('Delivery Order Controller - onPaused called');
    checkShareDeliveryRoomStatus();
  }

  // Mandatory 재게
  @override
  void onResumed() {
    Logger().d('Delivery Order Controller - onResumed called');
  }

  Future<void> fetchDeliveryOrderDetail() async {
    Logger().d("fetchDeliveryOrderDetail");
    // repository.getOrderList(deliveryRoomId)
  }

  Future<void> checkShareDeliveryRoomStatus() async {
    Logger().d("checkShareDeliveryRoomStatus");
  }
}
