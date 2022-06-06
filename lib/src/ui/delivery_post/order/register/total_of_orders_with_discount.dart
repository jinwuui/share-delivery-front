import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_recruit_controller.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_room_info_detail_controller.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/order_form_register_controller.dart';
import 'package:share_delivery/src/ui/delivery_post/order/register/register_discount_info.dart';
import 'package:share_delivery/src/ui/delivery_post/widget/payment_menu.dart';
import 'package:share_delivery/src/ui/delivery_post/widget/user_order_detail.dart';
import 'package:share_delivery/src/ui/theme/text_theme.dart';

class TotalOfOrdersWithDiscount extends StatelessWidget {
  const TotalOfOrdersWithDiscount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "주문 내용 확인",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  elevation: 0.0,
                  side: BorderSide(width: 1.0, color: Colors.grey.shade300),
                ),
                onPressed: () {
                  Get.bottomSheet(
                    RegisterDiscountInfo(),
                  );
                },
                child: Text(
                  "할인 정보 등록",
                  style: TextStyle(color: Colors.black),
                ),
              )
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
                    children: DeliveryRecruitController.to.orderMenuList
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
                _buildTotalPayment()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalPayment() {
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
          _buildDiscountWidget(),
          Divider(
            thickness: 1.0,
            height: 20.0,
          ),
          Obx(
            () => PaymentMenu(
              elementName: "총 결제금액",
              money: deliveryTip +
                  totalPaymentMoney -
                  OrderFormRegisterController.to.discountModels.fold(
                      0,
                      (previousValue, element) =>
                          previousValue + element.amount),
              axisAlignment: MainAxisAlignment.end,
              textStyle: paymentTextStyle,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDiscountWidget() {
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
}
