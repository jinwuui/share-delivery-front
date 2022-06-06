import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

String imagePathWithHost(String path) {
  return "${dotenv.get("SERVER_IMAGE_URI")}$path";
}

NetworkImage customNetworkImage(String imagePath) {
  NetworkImage _image;

  try {
    _image = NetworkImage(imagePathWithHost(imagePath));
  } catch (e) {
    debugPrint(e.toString());
    Logger().w(e);
    _image = NetworkImage(
        "https://cdn.pixabay.com/photo/2016/01/20/13/05/cat-1151519__480.jpg");
    Get.snackbar(
      "사진 로드 실패",
      "기본 이미지 불러오기",
      backgroundColor: Colors.white,
    );
  }
  return _image;
}

NetworkImage randomProfileImage() {
  return NetworkImage(
      "https://cdn.pixabay.com/photo/2016/01/20/13/05/cat-1151519__480.jpg");
  String host = dotenv.get("SERVER_IMAGE_URI");
  String dummyPath =
      "/images/DUMMYIMAGE_${(DateTime.now().microsecondsSinceEpoch % 6 + 1)}.png";
  return NetworkImage(host + dummyPath);
}
