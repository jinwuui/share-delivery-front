import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpandedPostImage extends StatelessWidget {
  const ExpandedPostImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imageURL = Get.arguments['imagePath'];

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: imageURL.substring(0, 4) == "http"
              ? NetworkImage(imageURL)
              : FileImage(File(imageURL)) as ImageProvider, // 배경 이미지
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Container(
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
              child: const Icon(
                Icons.close_rounded,
                size: 35,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
      ),
    );
  }
}
