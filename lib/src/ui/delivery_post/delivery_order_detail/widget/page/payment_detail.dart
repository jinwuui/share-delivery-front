import 'package:flutter/material.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/organisms/check_order_and_total_payment.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/organisms/order_form_screen_shot.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/organisms/check_remit_of_user_section.dart';

// TODO:
// OrderFormRegister 컨트롤러 그대로 가져오기 ( 주문서, 주문 내역 )
// PaymentDetail - 송금했는지 체크하기 위한 컨트롤러 필요

class DeliveryPaymentDetail extends StatelessWidget {
  const DeliveryPaymentDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          OrderFormScreenShotSection(),
          CheckOrderAndTotalPaymentSection(registerDiscountButton: false),
          CheckRemitOfUserSection(),
        ],
      ),
    );
  }
}
