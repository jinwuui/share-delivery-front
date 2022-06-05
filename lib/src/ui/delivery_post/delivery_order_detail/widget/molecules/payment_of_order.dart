import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_recruit_controller.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_room_info_detail_controller.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/order_form_register_controller.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/atoms/payment_menu.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/atoms/user_menu.dart';
import 'package:share_delivery/src/ui/theme/text_theme.dart';

// extends GetView<OrderFormRegisterController>
class PaymentOfOrder extends StatelessWidget {
  const PaymentOfOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("paymentoforder re build");

    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => PaymentMenu(
              elementName: "총 주문 금액",
              money: DeliveryRecruitController.to.totalPaymentMoney.value,
              axisAlignment: MainAxisAlignment.end,
              textStyle: paymentTextStyle,
            ),
          ),
          PaymentMenu(
            elementName: "배달팁",
            money: DeliveryRoomInfoDetailController.to.deliveryRoom.deliveryTip,
            axisAlignment: MainAxisAlignment.end,
            textStyle: paymentTextStyle,
          ),
          Get.isRegistered<OrderFormRegisterController>()
              ? _buildDiscountWidget()
              : SizedBox.shrink(),
          Divider(
            thickness: 1.0,
            height: 20.0,
          ),
          _buildTotalPaymentMoney()
        ],
      ),
    );
  }

  _buildDiscountWidget() {
    return Obx(() {
      List<PaymentMenu> discountList =
          OrderFormRegisterController.to.discountModels
              .map(((element) => PaymentMenu(
                    elementName: element.paymentDiscountName.toString(),
                    money: element.amount,
                    axisAlignment: MainAxisAlignment.end,
                    textStyle: paymentTextStyle,
                  )))
              .toList();

      return Column(
        children: discountList,
      );
    });
  }

  _buildTotalPaymentMoney() {
    return Obx(
      () {
        int orderTip =
            DeliveryRoomInfoDetailController.to.deliveryRoom.deliveryTip;

        // 할인 정보 포함 금액 계산
        var totalPaymentMoney =
            DeliveryRecruitController.to.totalPaymentMoney.value + orderTip;

        if (Get.isRegistered<OrderFormRegisterController>() &&
            OrderFormRegisterController.to.discountModels.isNotEmpty) {
          int discountSum = OrderFormRegisterController.to.discountModels.fold(
              0, (previousValue, element) => previousValue + element.amount);
          totalPaymentMoney -= discountSum;
        }

        return PaymentMenu(
          elementName: "총 결제금액",
          money: totalPaymentMoney,
          axisAlignment: MainAxisAlignment.end,
          textStyle: paymentTextStyle,
        );
      },
    );
  }
}
