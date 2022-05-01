import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_order_controller.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_recruit_controller.dart';
import 'package:share_delivery/src/data/model/delivery_order_detail/user_with_order_model.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/molecules/payment_of_order.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/organisms/user_order.dart';

//TODO: user order getx controller 만들기

class DeliveryRecruitDetail extends GetView<DeliveryRecruitController> {
  const DeliveryRecruitDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DeliveryRecruitController());
    controller.userWithOrderList.add(
      UserWithOrderModel(
          userId: 'park', orderDate: DateTime.now(), menuList: []),
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...controller.userWithOrderList
                .map((e) => UserOrder(
                      userWithOrderModel: e,
                    ))
                .toList(),
            // UserOrder(),
            // UserOrder(),
            // UserOrder(),
            // UserOrder(),
            _buildAmountOfOrder(),
          ],
        ),
      ),
      bottomNavigationBar: _buildCheckComplitedButton(),
    );
  }

  Widget _buildAmountOfOrder() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(10),
      ),
      child: PaymentOfOrder(),
    );
  }

  Widget _buildCheckComplitedButton() {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 30),
      margin: const EdgeInsets.all(10.0),

      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.orange,
        ),
        onPressed: () {
          Get.snackbar(
            "주문 진행 확인",
            "주문 상세 정보 입력 페이지로 이동",
            backgroundColor: Colors.white,
            duration: Duration(
              seconds: 1,
            ),
          );
          Get.find<DeliveryOrderController>().changeStatus('loading');
        },
        child: Text("주문 진행 확인"),
      ),
    );
  }
}


/*
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
*/