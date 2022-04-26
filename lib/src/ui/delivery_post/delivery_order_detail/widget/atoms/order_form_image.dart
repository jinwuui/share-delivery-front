import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderFormImage extends StatelessWidget {
  OrderFormImage({Key? key, required this.imageURL}) : super(key: key);

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
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
            image: NetworkImage(imageURL),
          ),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: Colors.grey,
        ),
      ),
    );
  }
}
