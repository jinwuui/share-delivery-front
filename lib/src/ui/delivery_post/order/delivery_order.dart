import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_order_controller.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_room_info_detail_controller.dart';
import 'package:share_delivery/src/controller/login/authentication_controller.dart';
import 'package:share_delivery/src/data/model/user/user/user.dart';
import 'package:share_delivery/src/services/delivery_room_manage_service.dart';
import 'package:share_delivery/src/services/setting_service.dart';
import 'package:share_delivery/src/ui/delivery_post/order/payment/delivery_payment_detail.dart';
import 'package:share_delivery/src/ui/delivery_post/order/recruit/recruit.dart';
import 'package:share_delivery/src/ui/delivery_post/order/register/register_order_form.dart';

class DeliveryOrder extends StatelessWidget {
  const DeliveryOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = DeliveryOrderController.to;
    int leaderId =
        DeliveryRoomInfoDetailController.to.deliveryRoom.leader.accountId;
    User user = AuthenticationController.to.state.props.first as User;
    Logger().w(controller.deliveryOrderStatus.value);
    return Column(
      children: [
        Expanded(
          child: Obx(() {
            if (controller.deliveryOrderStatus.value ==
                DeliveryRoomState.OPEN) {
              return DeliveryRecruit();
            } else if (controller.deliveryOrderStatus.value ==
                DeliveryRoomState.WAITING_PAYMENT) {
              return leaderId == user.accountId
                  ? RegisterOrderForm()
                  : Center(
                      child: Text("주도자가 배달 주문 진행 중 입니다."),
                    );
            } else if (controller.deliveryOrderStatus.value ==
                    DeliveryRoomState.WAITING_DELIVERY ||
                controller.deliveryOrderStatus.value ==
                    DeliveryRoomState.WAITING_REMITTANCE ||
                controller.deliveryOrderStatus.value ==
                    DeliveryRoomState.COMPLETED) {
              return DeliveryPaymentDetail();
            } else if (controller.deliveryOrderStatus.value ==
                DeliveryRoomState.DELETED) {
              return Center(
                child: Text("해당 모집글은 삭제되었습니다."),
              );
            } else {
              return Container();
            }
          }),
        ),
      ],
    );
  }
}
