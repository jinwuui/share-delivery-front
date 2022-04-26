import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/order_form_register_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
          Fluttertoast.showToast(
            msg: "3장 이상 사진을 올릴 수 없습니다.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
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
