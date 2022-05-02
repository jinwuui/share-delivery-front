import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    print('Delivery Order Controller - onDetached called');
  }

  // Mandatory 처음 활성화
  @override
  void onInactive() {
    print('Delivery Order Controller - onInative called');
  }

  // Mandatory 백그라운드
  @override
  void onPaused() {
    print('Delivery Order Controller - onPaused called');
  }

  // Mandatory 재게
  @override
  void onResumed() {
    print('Delivery Order Controller - onResumed called');
  }
}


/*
  // void _redisInit() {
  //   final conn = RedisConnection();

  //   conn.connect('192.168.219.100', 6379).then((Command command) {
  //     final pubsub = PubSub(command);

  //     pubsub.subscribe(["channel"]);

  //     pubsub.getStream().listen((message) {
  //       print("message: $message");

  //       changeStatus(message[2]);
  //     });
  //   });
  // }
*/