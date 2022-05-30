import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_recruit_controller.dart';
import 'package:share_delivery/src/data/model/delivery_order_detail/order_menu_model.dart';

enum DeliveryOrderStatus {
  none,
  recuritmentWaiting,
  recuritmentCompleted,
  orderCompleted
}

class DeliveryOrderController extends FullLifeCycleController
    with FullLifeCycleMixin {
  static DeliveryOrderController get to => Get.find();
  DeliveryOrderController();

  final deliveryOrderStatus = DeliveryOrderStatus.recuritmentWaiting.obs;

  get status => deliveryOrderStatus;
  set status(value) => deliveryOrderStatus.value = value;

  changeStatus(DeliveryOrderStatus value) {
    print("change");
    if (value == DeliveryOrderStatus.recuritmentCompleted) {
      deliveryOrderStatus.value = DeliveryOrderStatus.recuritmentCompleted;
    } else if (value == DeliveryOrderStatus.orderCompleted) {
      deliveryOrderStatus.value = DeliveryOrderStatus.orderCompleted;
    }
  }

  @override
  void onInit() {
    print("Delivery Order Controller INit");

    super.onInit();
  }

  // Mandatory 뭐지이건
  @override
  void onDetached() {
    print('@@@@@@@@@@@@@@Delivery Order Controller - onDetached called');
  }

  // Mandatory 처음 활성화
  @override
  void onInactive() {
    print('@@@@@@@@@@@@@@Delivery Order Controller - onInative called');
    // fetchDeliveryOrderDetail();
  }

  // Mandatory 백그라운드
  @override
  void onPaused() {
    print('@@@@@@@@@@@@@@Delivery Order Controller - onPaused called');
  }

  // Mandatory 재게
  @override
  void onResumed() {
    print('@@@@@@@@@@@@@@Delivery Order Controller - onResumed called');
    // fetchDeliveryOrderDetail();
    // fetchDeliveryOrderDetail();
  }

  Future<void> fetchDeliveryOrderDetail() async {
    Logger().d("fetchDeliveryOrderDetail");

    await Future.delayed(Duration(seconds: 1));

    // 더미 데이터
    DeliveryRecruitController.to.orderMenuList.add(
      OrderMenuModel(
        entryOrderId: 1,
        accountId: 2,
        phoneNumber: "01000000001",
        type: "hello",
        status: "world",
        menus: [
          Menu(
            orderMenuId: 3,
            menuName: "황금올리브",
            quantity: 1,
            price: 15000,
          ),
          Menu(
            orderMenuId: 3,
            menuName: "치즈볼",
            quantity: 1,
            price: 5000,
          ),
        ],
        createdDateTime: DateTime.now(),
      ),
    );
  }
}
