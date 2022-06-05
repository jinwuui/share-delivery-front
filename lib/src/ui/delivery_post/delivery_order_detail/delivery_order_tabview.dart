import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_order_controller.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_room_info_detail_controller.dart';
import 'package:share_delivery/src/controller/login/authentication_controller.dart';
import 'package:share_delivery/src/data/model/user/user/user.dart';
import 'package:share_delivery/src/services/delivery_room_manage_service.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/page/order_form_register.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/page/payment_detail.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/page/recruit_detail.dart';

class OrderTabView extends StatelessWidget {
  const OrderTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = DeliveryOrderController.to;
    int leaderId =
        DeliveryRoomInfoDetailController.to.deliveryRoom.leader.accountId;
    User user = AuthenticationController.to.state.props.first as User;
    Logger().w(controller.deliveryOrderStatus.value);
    return Column(
      children: [
        _buildDeliveryRoomStatus(),
        Expanded(
          child: Obx(() {
            if (controller.deliveryOrderStatus.value ==
                DeliveryRoomState.OPEN) {
              return DeliveryRecruitDetail();
            } else if (controller.deliveryOrderStatus.value ==
                DeliveryRoomState.WAITING_PAYMENT) {
              return leaderId == user.accountId
                  ? RegisterOrderForm()
                  : Container(
                      child: Text("주도자가 주문 진행 중"),
                    );
            } else if (controller.deliveryOrderStatus.value ==
                DeliveryRoomState.WAITING_DELIVERY) {
              return DeliveryPaymentDetail();
            } else if (controller.deliveryOrderStatus.value ==
                DeliveryRoomState.DELETED) {
              return Center(
                child: Text("deleted"),
              );
            } else {
              return Container();
            }
          }),
        ),
      ],
    );
  }

  Widget _buildDeliveryRoomStatus() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            describeEnum(DeliveryOrderController.to.deliveryOrderStatus.value),
            style: TextStyle(fontSize: 20, color: Colors.red),
          ),
        ),
      ),
    );
  }
}
