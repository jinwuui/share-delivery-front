import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/order_form_register_controller.dart';

class AddOrderFormButton extends StatelessWidget {
  const AddOrderFormButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        try {
          await Get.find<OrderFormRegisterController>().pickImage();
        } catch (e) {
          print(e);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.all(10.0),
        width: 100.0,
        height: 150.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            color: Colors.grey.shade400),
        child: Icon(
          Icons.add_a_photo,
          size: 40,
        ),
      ),
    );
  }
}
