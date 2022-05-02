import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_order_controller.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/order_form_register_controller.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/organisms/check_order_and_total_payment.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/organisms/register_order_form_screen_shot.dart';

// TODO:
// 주도자인지 참여자인지 구분해서 UI 변경

class RegisterOrderForm extends StatelessWidget {
  const RegisterOrderForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderFormRegisterController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            RegisterOrderFormScreenShotSection(),
            SizedBox(
              height: 30,
            ),
            CheckOrderAndTotalPaymentSection(registerDiscountButton: true),
            SizedBox(
              height: 30.0,
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildRegisterDeliveryDetailButton(),
    );
  }

  Widget _buildRegisterDeliveryDetailButton() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.orange,
        ),
        onPressed: () {
          if (Get.find<OrderFormRegisterController>().orderFormList.isEmpty) {
            Get.snackbar("주문 영수증 등록", "최소 1장의 주문 영수증을 등록해주세요!",
                backgroundColor: Colors.white);
            return;
          }
          Get.snackbar(
            "주문 상세 정보 등록 완료",
            "배달 대기 화면으로 이동",
            backgroundColor: Colors.white,
            duration: Duration(
              seconds: 1,
            ),
          );

          DeliveryOrderController.to
              .changeStatus(DeliveryOrderStatus.orderCompleted);
        },
        child: Text("배달 주문 정보 등록 완료"),
      ),
    );
  }
}
