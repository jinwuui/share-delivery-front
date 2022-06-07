import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_payment_detail_controller.dart';
import 'package:share_delivery/src/ui/delivery_post/widget/order_form_image.dart';

class PaymentOrderFormScreenShotSection
    extends GetView<DeliveryPaymentDetailController> {
  const PaymentOrderFormScreenShotSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "주문서 스크린샷",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
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
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: controller.deliveryPaymentDetail.orderFormUrlList
                    .map(
                      (url) => OrderFormImage(
                          imageURL: url,
                          deleteButton: false,
                          isNetworkImage: true),
                    )
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
