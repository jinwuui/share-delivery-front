import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_order_controller.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/order_form_register_controller.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/organisms/check_order_and_payment.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/organisms/register_expected_delivery_time.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/organisms/register_order_form_screen_shot.dart';

// TODO:
// 주도자인지 참여자인지 구분해서 UI 변경

class RegisterOrderForm extends StatelessWidget {
  const RegisterOrderForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderFormRegisterController());

    return Column(
      children: [
        RegisterOrderFormScreenShotSection(),
        CheckOrderAndPaymentSection(),
        _buildRegisterDiscountButton(),
        RegisterExpectedDeliveryTimeSection(),
        _buildRegisterDeliveryDetailButton(),
      ],
    );
  }

  Widget _buildRegisterDiscountButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.orange,
      ),
      onPressed: () {},
      child: Text("할인 정보 등록"),
    );
  }

  Widget _buildRegisterDeliveryDetailButton() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      height: 50,
      width: 300,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.orange,
        ),
        onPressed: () {
          Get.find<DeliveryOrderController>().changeStatus('loaded');
        },
        child: Text("배달 주문 정보 등록 완료"),
      ),
    );
  }
}
