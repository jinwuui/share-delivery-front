import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_recruit_controller.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/order_form_register_controller.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/atoms/element_with_money.dart';
import 'package:share_delivery/src/ui/theme/text_theme.dart';

// extends GetView<OrderFormRegisterController>
class PaymentOfOrder extends StatelessWidget {
  PaymentOfOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("paymentoforder re build");

    final orderTip = 4000;

    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => ElementWithMoney(
              elementName: "총 주문 금액",
              money: DeliveryRecruitController.to.totalPaymentMoney.toString(),
              axisAlignment: MainAxisAlignment.end,
              textStyle: paymentTextStyle,
            ),
          ),
          ElementWithMoney(
            elementName: "배달팁",
            money: orderTip.toString(),
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
          _buildTotalPaymentMoney(orderTip)
        ],
      ),
    );
  }

  _buildDiscountWidget() {
    return Obx(() {
      List<ElementWithMoney> discountList = [];

      Get.find<OrderFormRegisterController>().discountMap.forEach((key, value) {
        discountList.add(
          ElementWithMoney(
            elementName: key.toString(),
            money: "-" + value.toString(),
            axisAlignment: MainAxisAlignment.end,
            textStyle: paymentTextStyle,
          ),
        );
      });

      return Column(
        children: discountList,
      );
    });
  }

  _buildTotalPaymentMoney(int orderTip) {
    return Obx(
      () {
        // 할인 정보 포함 금액 계산
        var totalPaymentMoney =
            DeliveryRecruitController.to.totalPaymentMoney.value + orderTip;

        if (Get.isRegistered<OrderFormRegisterController>() &&
            OrderFormRegisterController.to.discountMap.isNotEmpty) {
          print("discount");
          totalPaymentMoney -= int.parse(OrderFormRegisterController
              .to.discountMap.values
              .toList()
              .reduce((value, element) => value + element));
        }

        return ElementWithMoney(
          elementName: "총 결제금액",
          money: totalPaymentMoney.toString(),
          axisAlignment: MainAxisAlignment.end,
          textStyle: paymentTextStyle,
        );
      },
    );
  }
}
