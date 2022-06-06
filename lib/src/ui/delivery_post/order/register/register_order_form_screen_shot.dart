import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/order_form_register_controller.dart';
import 'package:share_delivery/src/ui/delivery_post/widget/order_form_image.dart';

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
              child: Obx(
                () => Row(
                  children: [
                    ...OrderFormRegisterController.to.orderForms
                        .map(
                          (image) => OrderFormImage(
                            imageURL: image.path,
                            isNetworkImage: false,
                            deleteButton: true,
                          ),
                        )
                        .toList(),
                    _buildAddOrderFormButton(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAddOrderFormButton() {
    return GestureDetector(
      onTap: () async {
        try {
          await OrderFormRegisterController.to.pickImage();
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
