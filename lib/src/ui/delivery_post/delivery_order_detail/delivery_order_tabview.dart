import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_order_controller.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/page/order_form_register.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/page/payment_detail.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/page/recruit_detail.dart';

// TODO: 나의 주문 메뉴 + 다른 사람의 주문 메뉴
// 주도자인지 참여자인지 구분해서 UI 변경
// 주문 진행 상태에 따라서 UI 변경 해야함 status 상태 하나 두어서 rebuild 시키기

class OrderTabView extends StatelessWidget {
  const OrderTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = DeliveryOrderController.to;

    return Obx(() {
      if (controller.deliveryOrderStatus.value ==
              DeliveryOrderStatus.recuritmentWaiting ||
          controller.deliveryOrderStatus.value == DeliveryOrderStatus.none) {
        return DeliveryRecruitDetail();
      } else if (controller.deliveryOrderStatus.value ==
          DeliveryOrderStatus.recuritmentCompleted) {
        return RegisterOrderForm();
      } else if (controller.deliveryOrderStatus.value ==
          DeliveryOrderStatus.orderCompleted) {
        return DeliveryPaymentDetail();
      } else {
        return Container();
      }
    });
  }
}
