import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderFormImage extends StatelessWidget {
  OrderFormImage({Key? key, required this.imageURL}) : super(key: key);

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    print(imageURL);
    print(imageURL.substring(0, 4));
    return GestureDetector(
      onTap: () {
        print(imageURL);
        Get.toNamed('/exapndedImagePage', arguments: imageURL);
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.all(10.0),
        width: 100.0,
        height: 100.0,
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
    );
  }
}
