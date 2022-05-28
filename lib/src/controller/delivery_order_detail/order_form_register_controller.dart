import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_recruit_controller.dart';
import 'package:share_delivery/src/data/repository/delivery_order_detail/delivery_order_detail_repository.dart';

class OrderFormRegisterController extends GetxController {
  final DeliveryOrderDetailRepository repository;

  static OrderFormRegisterController get to => Get.find();
  OrderFormRegisterController({required this.repository});

  final orderFormList = <XFile>[].obs;
  final orderList = [].obs;
  final discountMap = {}.obs;

  @override
  void onInit() {
    print("Delivery Order Controller INit");
    for (var element in DeliveryRecruitController.to.orderMenuList) {
      orderList.add(element.menus);
    }
    super.onInit();
  }

  Future<void> registerDeliveryRoomOrderDetail() async {
    await repository.registerDeliveryRoomOrderDetail();
  }

  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();

    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
      );
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
}

class ImagePickerException implements Exception {
  String message;

  ImagePickerException({required this.message});

  @override
  String toString() {
    return message;
  }
}
