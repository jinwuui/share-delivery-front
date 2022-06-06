import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_payment_detail_controller.dart';
import 'package:share_delivery/src/ui/delivery_post/widget/payment_menu.dart';
import 'package:share_delivery/src/ui/delivery_post/widget/user_order_detail.dart';
import 'package:share_delivery/src/ui/theme/text_theme.dart';

class TotalPaymentOfDelivery extends GetView<DeliveryPaymentDetailController> {
  const TotalPaymentOfDelivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "주문 내용 확인",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
              color: Colors.white70,
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: controller.deliveryPaymentDetail.orders
                        .map((element) =>
                            UserOrderDetail(orderMenuModel: element))
                        .toList(),
                  ),
                ),
                Divider(
                  thickness: 1.0,
                  height: 20.0,
                  indent: 10.0,
                  endIndent: 10.0,
                ),
                _buildTotalPayment(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalPayment() {
    var totalOrderMoney = 0;
    for (var element in controller.deliveryPaymentDetail.orders) {
      for (var e in element.menus) {
        totalOrderMoney += e.price * e.quantity;
        totalOrderMoney += e.optionMenus.fold(
            0,
            (previousValue, element) =>
                previousValue + element.price * e.quantity);
      }
    }
    final int totalPaymentOfOrders = totalOrderMoney -
        controller.deliveryPaymentDetail.totalDiscountAmount +
        controller.deliveryPaymentDetail.deliveryFee;

    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PaymentMenu(
            elementName: "총 주문 금액",
            money: totalOrderMoney,
            axisAlignment: MainAxisAlignment.end,
            textStyle: paymentTextStyle,
          ),
          PaymentMenu(
            elementName: "배달팁",
            money: controller.deliveryPaymentDetail.deliveryFee,
            axisAlignment: MainAxisAlignment.end,
            textStyle: paymentTextStyle,
          ),
          _buildDiscountWidget(),
          Divider(
            thickness: 1.0,
            height: 20.0,
          ),
          PaymentMenu(
            elementName: "총 결제금액",
            money: totalPaymentOfOrders,
            axisAlignment: MainAxisAlignment.end,
            textStyle: paymentTextStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildDiscountWidget() {
    List<PaymentMenu> discountList = controller.deliveryPaymentDetail.discounts
        .map(
          ((element) => PaymentMenu(
                elementName: element.paymentDiscountName.toString(),
                money: element.amount,
                axisAlignment: MainAxisAlignment.end,
                textStyle: paymentTextStyle,
              )),
        )
        .toList();

    return Column(
      children: discountList,
    );
  }
}
