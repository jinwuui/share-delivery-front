import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_room_info_detail_controller.dart';
import 'package:share_delivery/src/data/model/delivery_order_detail/user_with_order_model.dart';
import 'package:share_delivery/src/data/repository/delivery_order_detail/delivery_order_detail_repository.dart';

class DeliveryRecruitController extends GetxController
    with StateMixin<List<UserWithOrderModel>> {
  final DeliveryOrderDetailRepository repository;

  static DeliveryRecruitController get to => Get.find();
  DeliveryRecruitController({required this.repository});

  final userWithOrderList = <UserWithOrderModel>[].obs;
  final totalPaymentMoney = 0.obs;
  final orderTip = 4000.obs; // TODO:API

  @override
  void onInit() {
    super.onInit();
    ever(userWithOrderList, (_) {
      print(userWithOrderList);
      calculateTotalPaymentMoney();
    });
  }

  @override
  void onReady() async {
    super.onReady();

    try {
      change(null, status: RxStatus.loading());
      String deliveryRoomId = Get.arguments['deliveryRoomId'];

      userWithOrderList.value = await repository.getOrderList(deliveryRoomId);

      change(userWithOrderList, status: RxStatus.success());
    } catch (err) {
      change(null, status: RxStatus.error());
    }
  }

  Future<void> addUserWithOrder(UserWithOrderModel userWithOrderModel) async {
    userWithOrderList.add(userWithOrderModel);
  }

  Future<void> deleteUserWithOrder(String userId) async {
    try {
      // String roomId =
      //     DeliveryRoomInfoDetailController.to.deliveryRoom.value.roomId;

      //TODO: API
      // await repository.rejectUserOrder(userId, roomId);

      userWithOrderList.value =
          userWithOrderList.where((e) => e.userId != userId).toList();
    } catch (e) {
      print(e);
    }
  }

  Future<void> calculateTotalPaymentMoney() async {
    totalPaymentMoney.value = userWithOrderList
        .map((element) =>
            element.menuList.values.reduce((value, element) => value + element))
        .toList()
        .reduce((value, element) => value + element);
  }

  Future<void> completeRecurit() async {
    // repository.completeDeliveryRecruit();
  }
}
