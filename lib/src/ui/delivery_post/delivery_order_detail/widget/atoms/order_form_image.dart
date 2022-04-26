import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/order_form_register_controller.dart';

class OrderFormImage extends StatelessWidget {
  OrderFormImage({Key? key, required this.imageURL}) : super(key: key);

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/exapndedImagePage', arguments: imageURL);
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.all(10.0),
            width: 100.0,
            height: 150.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: imageURL.substring(0, 4) == "http"
                    ? NetworkImage(imageURL)
                    : FileImage(File(imageURL)) as ImageProvider,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color: Colors.grey,
            ),
          ),
          Positioned(
            right: 0,
            child: IconButton(
              onPressed: () {
                Get.find<OrderFormRegisterController>().deleteImage(imageURL);
              },
              icon: Icon(
                Icons.cancel_outlined,
                color: Colors.red,
                size: 25,
              ),
            ),
          )
        ],
      ),
    );
  }
}
