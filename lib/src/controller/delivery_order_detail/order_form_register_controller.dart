import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_recruit_controller.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_room_info_detail_controller.dart';
import 'package:share_delivery/src/data/repository/delivery_order_detail/delivery_order_detail_req_dto.dart';
import 'package:share_delivery/src/data/repository/delivery_order_detail/delivery_order_detail_repository.dart';

class OrderFormRegisterController extends GetxController {
  final DeliveryOrderDetailRepository repository;

  static OrderFormRegisterController get to => Get.find();
  OrderFormRegisterController({required this.repository});

  final orderForms = <XFile>[].obs;
  final orders = [].obs;
  final discountModels = <DiscountModel>[].obs;

  @override
  void onInit() {
    print("Delivery Order Controller INit");

    for (var element in DeliveryRecruitController.to.orderMenuList) {
      orders.add(element.menus);
    }

    super.onInit();
  }

  Future<void> registerDeliveryRoomOrderDetail() async {
    DeliveryOrderDetailReqDTO deliveryOrderDetailReqDTO =
        DeliveryOrderDetailReqDTO(
      deliveryFee: DeliveryRoomInfoDetailController.to.deliveryRoom.deliveryTip,
      discounts: discountModels,
    );

    List<File> orderFormFileList = [];

    for (var element in orderForms) {
      orderFormFileList.add(File(element.path));
    }

    int deliveryRoomId =
        DeliveryRoomInfoDetailController.to.deliveryRoom.roomId;

    try {
      String res = await repository.registerDeliveryRoomOrderDetail(
          deliveryOrderDetailDTO: deliveryOrderDetailReqDTO,
          deliveryRoomId: deliveryRoomId,
          orderFormFileList: orderFormFileList);

      Logger().w("res", res);

      Get.snackbar(
        "주문 상세 정보 등록 완료",
        "배달 대기 화면으로 이동",
        backgroundColor: Colors.white,
        duration: Duration(
          seconds: 1,
        ),
      );
    } catch (e) {
      Get.snackbar(
        "주문 상세 정보 등록 실패",
        "재시도 해주세요",
        backgroundColor: Colors.white,
        duration: Duration(
          seconds: 1,
        ),
      );
      print(e);
    }
  }

  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();

    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
      );
      List<XFile> newList = [image!, ...orderForms];

      if (newList.length > 2) {
        throw ImagePickerException(message: "사진 개수 초과");
      }

      orderForms.value = newList;
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
    orderForms.value =
        orderForms.where(((element) => element.path != imageURL)).toList();
  }

  Future<void> addDiscount(String menu, String amount) async {
    DiscountModel discountModel =
        DiscountModel(paymentDiscountName: menu, amount: int.parse(amount));

    if (discountModels.contains(discountModel)) {
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

    discountModels.add(discountModel);
  }

  Future<void> deleteDiscount(String menu) async {
    discountModels.value = discountModels
        .where((DiscountModel el) => el.paymentDiscountName != menu)
        .toList();
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
