import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/order_form_register_controller.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/atoms/add_order_form_button.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/atoms/order_form_image.dart';

class RegisterOrderFormScreenShotSection extends StatelessWidget {
  const RegisterOrderFormScreenShotSection({Key? key}) : super(key: key);

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
                child: Obx(() => Row(
                      children: [
                        ...Get.find<OrderFormRegisterController>()
                            .orderForms
                            .map(
                              (image) => OrderFormImage(
                                imageURL: image.path,
                                deleteButton: true,
                              ),
                            )
                            .toList(),
                        AddOrderFormButton()
                      ],
                    ))),
          )
        ],
      ),
    );
  }
}
