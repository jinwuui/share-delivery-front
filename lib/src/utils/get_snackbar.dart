import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetSnackbar {
  static void on(String title, String content) {
    Get.snackbar(
      title,
      content,
      backgroundColor: Colors.black,
      colorText: Colors.white,
      duration: Duration(milliseconds: 1000),
    );
  }

  static void err(String title, String content) {
    Get.snackbar(
      title,
      content,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(milliseconds: 1000),
    );
  }
}
