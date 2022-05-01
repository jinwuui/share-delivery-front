import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class OrderFormRegisterController extends GetxController {
  OrderFormRegisterController();

  final orderFormList = <XFile>[].obs;
  final discountMap = {}.obs;

  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();

    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      List<XFile> newList = [image!, ...orderFormList];

      if (newList.length > 2) {
        throw ImagePickerException(message: "사진 개수 초과");
      }

      orderFormList.value = newList;
    } catch (e) {
      if (e.runtimeType == ImagePickerException) {
        Get.snackbar(
          '사진 개수 초과',
          '3개 미만으로 올려주세요!',
          backgroundColor: Colors.grey.shade200,
          margin: EdgeInsets.all(20.0),
        );
      }
    }
  }

  Future<void> deleteImage(String imageURL) async {
    orderFormList.value =
        orderFormList.where(((element) => element.path != imageURL)).toList();
  }

  Future<void> addDiscountItem(String k, String v) async {
    if (discountMap.containsKey(k)) {
      Get.snackbar(
        "알림",
        "이미 등록한 할인 정보 입니다.",
        backgroundColor: Colors.white,
        duration: Duration(
          seconds: 1,
        ),
      );
      return;
    }
    discountMap[k] = v;
  }

  Future<void> deleteDiscountItem(String k) async {
    discountMap.remove(k);
  }

  // final deliveryTime = DateTime.now().obs;

  // Future<void> updateDeliveryTime(int minute) async {
  //   DateTime newDate = DateTime.utc(
  //       deliveryTime.value.year,
  //       deliveryTime.value.month,
  //       deliveryTime.value.day,
  //       deliveryTime.value.hour,
  //       deliveryTime.value.minute + minute);

  //   try {
  //     deliveryTime.value = newDate;
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}

class ImagePickerException implements Exception {
  String message;

  ImagePickerException({required this.message});

  @override
  String toString() {
    return message;
  }
}
