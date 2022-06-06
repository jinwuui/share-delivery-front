import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/order_form_register_controller.dart';
import 'package:share_delivery/src/routes/route.dart';
import 'package:share_delivery/src/utils/image_util.dart';

class OrderFormImage extends StatelessWidget {
  const OrderFormImage(
      {Key? key, required this.imageURL, required this.deleteButton})
      : super(key: key);

  final String imageURL;
  final bool deleteButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          Routes.EXPANDED_IMAGE_PAGE,
          arguments: {"imagePath": imageURL, "title": "주문서 확인"},
        );
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
                    ? customNetworkImage(imageURL)
                    : FileImage(File(imageURL)) as ImageProvider,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color: Colors.grey,
            ),
          ),
          deleteButton
              ? Positioned(
                  right: -10,
                  top: -10,
                  child: IconButton(
                    onPressed: () async {
                      await OrderFormRegisterController.to
                          .deleteImage(imageURL);
                    },
                    icon: Icon(
                      Icons.cancel_rounded,
                      color: Colors.black,
                      size: 25,
                    ),
                  ),
                )
              : SizedBox.shrink()
        ],
      ),
    );
  }
}
