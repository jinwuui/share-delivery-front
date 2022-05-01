import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_order_controller.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/organisms/user_order.dart';

class DeliveryRecruitDetail extends StatelessWidget {
  const DeliveryRecruitDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserOrder(),
        UserOrder(),
        UserOrder(),
        UserOrder(),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildOrderPaymentMoney(),
            _buildCheckComplitedButton(),
          ],
        ))
      ],
    );
  }

  Widget _buildOrderPaymentMoney() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("총 주문 금액 "),
              Text("54000"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("배달비 "),
              Text("4000"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("총 예상 결제 금액 "),
              Text("58000"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCheckComplitedButton() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      width: 200,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.orange,
        ),
        onPressed: () {
          Get.find<DeliveryOrderController>().changeStatus('loading');
        },
        child: Text("주문 진행 확인"),
      ),
    );
  }
}
