import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

Map<String, String> foodCategoryDummy = {
  "KOREAN":
      "https://cdn-icons.flaticon.com/png/128/4480/premium/4480784.png?token=exp=1653575835~hmac=daee661d047f1f0ed2164fca7d58ac22",
  "CHICKEN": "https://cdn-icons-png.flaticon.com/128/1046/1046751.png",
  "BOONSIK":
      "https://cdn-icons.flaticon.com/png/128/2276/premium/2276869.png?token=exp=1653575835~hmac=1eca2be8f7ec8aa2df4897ac358c6ec9",
  "CHINA": "https://cdn-icons-png.flaticon.com/128/2674/2674063.png",
  "STEAM_AND_SOUP":
      "https://cdn-icons.flaticon.com/png/128/2027/premium/2027144.png?token=exp=1653575973~hmac=b00c8b968f81472ca2f92ca1212ae526",
  "PIZZA": "https://cdn-icons-png.flaticon.com/128/3595/3595458.png",
  "JAPAN": "https://cdn-icons-png.flaticon.com/128/3925/3925263.png",
  "FASTFOOD": "https://cdn-icons-png.flaticon.com/128/3075/3075977.png",
  "LATE_NIGHT":
      "https://cdn-icons.flaticon.com/png/128/2388/premium/2388013.png?token=exp=1653627121~hmac=ca4333182dc7668c0234e978988b6ad6",
  "LUNCHBOX":
      "https://cdn-icons.flaticon.com/png/128/3321/premium/3321617.png?token=exp=1653576124~hmac=fee7e0a71b1f980c58cb224e565cb819",
};

Map<String, Color> deliveryRoomStateWithColor = {
  "OPEN": Colors.red, //인원 모집 중
  "WAITING_PAYMENT": Colors.orange, //주도자가 계산서 올리기를 기다리는 중
  "WAITING_DELIVERY": Colors.yellow, // 배달을 기다리는 중
  "WAITING_REMITTANCE": Colors.green, // 송금을 기다리는 중
  "COMPLETED": Colors.grey // 모두 완료
};

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
