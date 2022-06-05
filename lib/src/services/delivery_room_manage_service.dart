import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:share_delivery/src/controller/notification_controller/notification_controller.dart';
import 'package:share_delivery/src/data/model/delivery_room/delivery_room/delivery_room.dart';
import 'package:logger/logger.dart';
import 'package:share_delivery/src/services/setting_service.dart';

enum DeliveryRoomState {
  OPEN, //인원 모집 중
  WAITING_PAYMENT, //주도자가 계산서 올리기를 기다리는 중
  WAITING_DELIVERY, // 배달을 기다리는 중
  WAITING_REMITTANCE, // 송금을 기다리는 중
  COMPLETED, // 모두 완료
  DELETED, // 삭제된 주문
}

class DeliveryManageController extends FullLifeCycleController
    with FullLifeCycleMixin {
  static DeliveryManageController get to => Get.find();

  final roomId = 0.obs;
  final status = "".obs;

  Future<DeliveryManageController> init() async {
    var box = await Hive.openBox('deliveryRoom');

    try {
      roomId.value = box.keyAt(0);
      status.value = box.getAt(0);

      Logger().i("진행 중인 공유 배달", roomId.value.toString() + status.value);
    } catch (e) {
      Logger().w("진행중인 공유 배달 모집이 없습니다.");
    }
    return this;
  }

  Future<void> addDeliveryRoom(int roomId, DeliveryRoom deliveryRoom) async {
    Logger().w("addDeliveryRoom");
    var box = Hive.box('deliveryRoom');
    box.clear();

    this.roomId.value = roomId;
    status.value = deliveryRoom.status;
    box.put(roomId, deliveryRoom.status);

    NotificationController.to.showOngoingNotification(
        getDeliveryRoomStateWithColor(deliveryRoom.status).name,
        deliveryRoom.content);
  }

  Future<void> deleteDeliveryRoom() async {
    Logger().w("deleteDeliveryRoom");
    var box = Hive.box('deliveryRoom');

    box.clear();
    roomId.value = 0;
    status.value = "";

    await NotificationController.to.cancelAllNotifications();
  }

  Future<void> changeStatus(String status) async {
    this.status.value = status;
  }

  @override
  void onDetached() {
    deleteDeliveryRoom();
  }

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}
}
