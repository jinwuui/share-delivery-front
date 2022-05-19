import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/order_form_register_controller.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/atoms/element_with_money.dart';
import 'package:share_delivery/src/ui/theme/text_theme.dart';

// extends GetView<OrderFormRegisterController>
class PaymentOfOrder extends StatelessWidget {
  const PaymentOfOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElementWithMoney(
            elementName: "총 주문 금액",
            money: '50000',
            axisAlignment: MainAxisAlignment.end,
            textStyle: paymentTextStyle,
          ),
          ElementWithMoney(
            elementName: "배달팁",
            money: '4000',
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
          ElementWithMoney(
            elementName: "총 결제금액",
            money: "45000",
            axisAlignment: MainAxisAlignment.end,
            textStyle: paymentTextStyle,
          ),
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
            money: value.toString(),
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
}
