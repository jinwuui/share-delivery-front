import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:share_delivery/src/controller/delivery_history/delivery_history_controller.dart';
import 'package:share_delivery/src/controller/delivery_room_register/writing_menu_controller.dart';
import 'package:share_delivery/src/controller/home/home_controller.dart';
import 'package:share_delivery/src/controller/root_controller.dart';
import 'package:share_delivery/src/data/model/delivery_room/delivery_room/delivery_room.dart';
import 'package:share_delivery/src/data/model/delivery_room/menu/menu.dart';
import 'package:share_delivery/src/data/repository/delivery_room_register/delivery_room_register_repository.dart';
import 'package:share_delivery/src/routes/route.dart';
import 'package:share_delivery/src/services/delivery_room_manage_service.dart';
import 'package:share_delivery/src/utils/categories.dart';
import 'package:share_delivery/src/utils/get_snackbar.dart';

class DeliveryRoomRegisterController extends GetxController {
  static DeliveryRoomRegisterController get to => Get.find();

  final DeliveryRoomRegisterRepository repository;
  final WritingMenuController writingMenuController;

  DeliveryRoomRegisterController(
      {required this.writingMenuController, required this.repository});

  // 모집글 등록 정보
  final TextEditingController content = TextEditingController();
  final TextEditingController storeLink = TextEditingController();
  final TextEditingController storeName = TextEditingController();
  final TextEditingController deliveryAppTypeOfStoreLink =
      TextEditingController();

  static const int defaultLimitPerson = 2;
  int limitPerson = defaultLimitPerson;
  RxInt deliveryTip = 2000.obs;
  RxInt pickedStoreCategory = (-1).obs;

  RxString receivingLocationDescription = "".obs;
  RxDouble receivingLocationLatitude = (-1.0).obs;
  RxDouble receivingLocationLongitude = (-1.0).obs;

  // 모집글 등록을 위한 상세 정보
  final RxList<bool> numOfPeopleSelections = <bool>[true, false, false].obs;

  void selectNumOfPeopleSelections(int index) {
    limitPerson = index + defaultLimitPerson;

    for (int i = 0; i < numOfPeopleSelections.length; i++) {
      if (i == index) {
        numOfPeopleSelections[i] = true;
      } else {
        numOfPeopleSelections[i] = false;
      }
    }
  }

  bool validateDeliveryRoom() {
    return content.text.trim().isNotEmpty &&
        storeLink.text.trim().isNotEmpty &&
        storeName.text.trim().isNotEmpty &&
        deliveryAppTypeOfStoreLink.text.trim().isNotEmpty &&
        pickedStoreCategory.value != -1 &&
        receivingLocationDescription.value.isNotEmpty &&
        receivingLocationLatitude.value != -1.0 &&
        receivingLocationLongitude.value != -1.0;
  }

  Future<void> registerDeliveryRoom() async {
    print('DeliveryRoomRegisterController.registerDeliveryRoom');

    try {
      Map<String, dynamic> deliveryRoomInfo = _getDeliveryRoomInfo();
      Logger().v(deliveryRoomInfo);

      DeliveryRoom? deliveryRoom =
          await repository.registerDeliveryRoom(deliveryRoomInfo);

      Logger().i(deliveryRoom);

      if (deliveryRoom != null) {
        print("   모집글 등록 성공");
        await Get.find<HomeController>().onRefresh();

        // delivery history ui 갱신
        await DeliveryHistoryController.to.onRefresh();

        // 배달 관리 컨트롤러에 등록
        // DeliveryManageController.to
        //     .addDeliveryRoom(deliveryRoom.roomId, deliveryRoom);

        // 내 배달 -> 모집글 상세정보 조회 페이지로 이동
        Get.until((route) => Get.currentRoute == Routes.INITIAL);
        Get.find<RootController>().changeRootPageIndex(1);

        // 생성된 페이지로 이동
        Get.toNamed(
          Routes.DELIVERY_HISTORY_DETAIL,
          arguments: {"deliveryRoomId": deliveryRoom.roomId},
        );
      } else {
        print("   모집글 등록 실패");
        throw Exception("등록 실패");
      }
    } catch (e) {
      print(e);
      GetSnackbar.on("실패", "[TODO: 에러메시지로 대체 필요]]");
    }
  }

  Map<String, dynamic> _getDeliveryRoomInfo() {
    Map<String, dynamic> deliveryRoomInfo = {};

    deliveryRoomInfo["content"] = content.text;
    deliveryRoomInfo["receivingLocation"] = {
      "description": receivingLocationDescription.value,
      "latitude": receivingLocationLatitude.value,
      "longitude": receivingLocationLongitude.value,
    };
    deliveryRoomInfo["limitPerson"] = limitPerson;
    deliveryRoomInfo["storeCategory"] =
        foodCategories[pickedStoreCategory.value].eng;
    deliveryRoomInfo["shareStore"] = {
      "link": storeLink.text,
      "name": storeName.text,
      "type": _getLinkPlatformType(deliveryAppTypeOfStoreLink.text),
    };

    deliveryRoomInfo["deliveryTip"] = deliveryTip.value;
    deliveryRoomInfo["menuList"] =
        writingMenuController.convertMenuInfoToMenu();

    print(
        'DeliveryRoomRegisterController._getDeliveryRoomInfo $deliveryRoomInfo');
    return deliveryRoomInfo;
  }

  String _getLinkPlatformType(String type) {
    return type == "배달의민족" ? "BAEMIN" : "YOGIYO";
  }

  void parsingStoreLink(ClipboardData? data) {
    try {
      if (data == null) {
        GetSnackbar.on("알림", "클립보드에 저장된 내용이 없습니다.");
        return;
      }

      Logger().v(data.text);
      print(data.text);

      String? clip = data.text;

      print(data.text);
      if (clip == null) {
        GetSnackbar.on("알림", "클립보드에 저장된 내용이 없습니다.");
        return;
      }

      late String appType;
      if (clip.contains("배달의민족")) {
        appType = "배달의민족";
      } else {
        appType = "요기요";
      }

      String storeName =
          clip.substring(clip.indexOf("'") + 1, clip.lastIndexOf("'"));

      late String storeLink;
      if (appType == "배달의민족" && !clip.contains("http")) {
        storeLink = "https://dummyURL";
      } else {
        storeLink = clip.substring(clip.indexOf("http"));
      }

      this.storeLink.text = storeLink;
      this.storeName.text = storeName;
      deliveryAppTypeOfStoreLink.text = appType;
      print(
          "클립보드 파싱 ${this.storeLink.text} ${this.storeName.text} ${deliveryAppTypeOfStoreLink.text}");
    } catch (e) {
      Logger().e("클립보드 파싱 에러");
      GetSnackbar.err("오류", "배민, 요기요 링크를 붙여넣어주세요!");
    }
  }

  void setDeliveryTip(int deliveryTip) {
    this.deliveryTip.value = deliveryTip;
  }

  void setReceivingLocation(
    String description,
    double latitude,
    double longitude,
  ) {
    print('DeliveryRoomRegisterController.setReceivingLocation');
    print(description);
    print(latitude);
    print(longitude);
    print('DeliveryRoomRegisterController.setReceivingLocation');
    print(ReceivingLocation(
      description: description,
      latitude: latitude,
      longitude: longitude,
    ));

    receivingLocationDescription.value = description;
    receivingLocationLatitude.value = latitude;
    receivingLocationLongitude.value = longitude;
  }

  void setPickedStoreCategory(int index) {
    pickedStoreCategory.value = index;
  }

  String getPickedStoreCategory() {
    return pickedStoreCategory.value != -1
        ? foodCategories[pickedStoreCategory.value].kor
        : "";
  }

  dummyDeliveryRoomRegisterTest() async {
    print('DeliveryRoomRegisterController.dummyDeliveryRoomRegisterTest');
    Map<String, dynamic> deliveryRoomInfo = {};

    deliveryRoomInfo["content"] = "asdf";
    deliveryRoomInfo["receivingLocation"] = {
      "description": "asdf",
      "latitude": 38.23,
      "longitude": 128.1234,
    };
    deliveryRoomInfo["limitPerson"] = 4;
    deliveryRoomInfo["storeCategory"] = "JAPAN";
    deliveryRoomInfo["shareStore"] = {
      "link": "https://dummy.com",
      "name": "가게이름",
      "type": "BAEMIN",
    };

    deliveryRoomInfo["deliveryTip"] = 3000;
    deliveryRoomInfo["menuList"] = <Menu>[
      Menu(name: "메뉴1", price: 3000, quantity: 1)
    ];

    Logger().v(deliveryRoomInfo);

    DeliveryRoom? deliveryRoom =
        await repository.registerDeliveryRoom(deliveryRoomInfo);
  }
}
