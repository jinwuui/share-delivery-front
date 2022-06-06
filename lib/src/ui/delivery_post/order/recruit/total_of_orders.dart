import 'package:flutter/material.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_recruit_controller.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_room_info_detail_controller.dart';
import 'package:share_delivery/src/ui/delivery_post/widget/payment_menu.dart';
import 'package:share_delivery/src/ui/theme/text_theme.dart';

class TotalOfOrders extends StatelessWidget {
  const TotalOfOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final totalPaymentMoney =
        DeliveryRecruitController.to.totalPaymentMoney.value;
    final deliveryTip =
        DeliveryRoomInfoDetailController.to.deliveryRoom.deliveryTip;
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PaymentMenu(
            elementName: "총 주문 금액",
            money: totalPaymentMoney,
            axisAlignment: MainAxisAlignment.end,
            textStyle: paymentTextStyle,
          ),
          PaymentMenu(
            elementName: "배달팁",
            money: deliveryTip,
            axisAlignment: MainAxisAlignment.end,
            textStyle: paymentTextStyle,
          ),
          Divider(
            thickness: 1.0,
            height: 20.0,
          ),
          PaymentMenu(
            elementName: "총 결제금액",
            money: deliveryTip + totalPaymentMoney,
            axisAlignment: MainAxisAlignment.end,
            textStyle: paymentTextStyle,
          ),
        ],
      ),
    );
  }
}
