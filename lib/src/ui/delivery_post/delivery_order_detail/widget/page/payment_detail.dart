import 'package:flutter/material.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/organisms/check_order_and_payment.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/organisms/expected_delivery_time.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/organisms/order_form_screen_shot.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/organisms/payment_detail.dart';

class DeliveryPaymentDetail extends StatelessWidget {
  const DeliveryPaymentDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          OrderFormScreenShotSection(),
          CheckOrderAndPaymentSection(),
          ExpectedDeliveryTimeSection(),
          PaymentDetail(),
        ],
      ),
    );
  }
}
