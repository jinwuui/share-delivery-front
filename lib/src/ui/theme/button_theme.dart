import 'package:flutter/material.dart';
import 'package:get/get.dart';

final whiteBtn = OutlinedButton.styleFrom(
  primary: Colors.black,
  textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
  elevation: 0,
  backgroundColor: Colors.white,
  fixedSize: Size(Get.width * 0.7, Get.height * 0.05),
);

final orangeBtn = ElevatedButton.styleFrom(
  primary: Colors.orange,
  textStyle: const TextStyle(fontSize: 17),
  elevation: 0,
  fixedSize: Size(Get.width * 0.7, Get.height * 0.05),
);
