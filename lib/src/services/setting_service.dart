import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

Map<String, String> foodCategoryDummy = {
  "KOREA": "https://cdn-icons-png.flaticon.com/128/4498/4498489.png",
  "CHICKEN": "https://cdn-icons-png.flaticon.com/512/123/123282.png",
  "BOONSIK": "https://cdn-icons-png.flaticon.com/128/4727/4727470.png",
  "CHINA": "https://cdn-icons-png.flaticon.com/128/2674/2674063.png",
  "STEAM_AND_SOUP": "https://cdn-icons-png.flaticon.com/128/590/590812.png",
  "PIZZA": "https://cdn-icons-png.flaticon.com/128/3595/3595458.png",
  "JAPAN": "https://cdn-icons-png.flaticon.com/128/3925/3925263.png",
  "FASTFOOD": "https://cdn-icons-png.flaticon.com/128/3075/3075977.png",
  "LATE_NIGHT": "https://cdn-icons-png.flaticon.com/128/740/740878.png",
  "LUNCHBOX": "https://cdn-icons-png.flaticon.com/128/3361/3361928.png",
};

// String getFoodCategory(String key) {
//   return foodCategoryDummy[key]!;
// }

class DeliveryRoomState {
  final MaterialColor color;
  final String name;
  DeliveryRoomState({
    required this.color,
    required this.name,
  });
}

enum FriendAcceptState {
  ACCEPT,
  REJECT,
  CANCEL,
}

final deliveryRoomStateWithColor = {
  "OPEN": DeliveryRoomState(color: Colors.orange, name: "인원 모집 중"),
  "WAITING_PAYMENT": DeliveryRoomState(color: Colors.red, name: "배달 주문 중"),
  "WAITING_DELIVERY": DeliveryRoomState(color: Colors.yellow, name: "배달 대기 중"),
  "WAITING_REMITTANCE": DeliveryRoomState(color: Colors.green, name: "송금 대기 중"),
  "COMPLETED": DeliveryRoomState(color: Colors.grey, name: "공유 배달 완료"),
};

DeliveryRoomState getDeliveryRoomStateWithColor(String key) {
  return deliveryRoomStateWithColor[key]!;
}

class SettingService extends GetxService {
  Future<SettingService> init() async {
    await storeFoodCategoryWithImage();
    return this;
  }

  // 음식 카테고리 이미지 매핑
  Future<void> storeFoodCategoryWithImage() async {
    var box = await Hive.openBox('foodCategory');

    foodCategoryDummy.forEach((key, value) {
      box.put(key, value);
    });
  }
}
