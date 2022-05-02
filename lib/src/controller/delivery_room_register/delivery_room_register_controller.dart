import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:share_delivery/src/data/model/delivery_room/receiving_location.dart';
import 'package:share_delivery/src/data/repository/delivery_room_register/delivery_room_register_repository.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DeliveryRoomRegisterController extends GetxController {
  final DeliveryRoomRegisterRepository repository;

  DeliveryRoomRegisterController({required this.repository});

  // 모집글 등록 정보
  final TextEditingController content = TextEditingController();
  final TextEditingController storeLink = TextEditingController();
  final TextEditingController descriptionOfReceivingLocation =
      TextEditingController();
  double receivingLocationLat = -1.0;
  double receivingLocationLng = -1.0;

  int limitPerson = -1;
  RxInt pickedStoreCategory = (-1).obs;

  // 모집글 등록을 위한 상세 정보
  final RxList<bool> numOfPeopleSelections = <bool>[true, false, false].obs;
  final List<Map> storeCategories = [
    {"한식": "KOREAN"},
    {"치킨": "CHICKEN"},
    {"피자": "PIZZA"},
    {"분식": "BOONSIK"},
    {"중식": "CHINA"},
    {"찜/탕": "STEAM_AND_SOUP"},
    {"피자": "PIZZA"},
    {"일식": "JAPAN"},
    {"패스트푸드": "FASTFOOD"},
    {"야식": "LATE_NIGHT"},
    {"도시락": "LUNCHBOX"},
  ];
  // "CHICKEN", "PIZZA", "CHINA", "JAPAN", "BOONSIK", "KOREA", "FASTFOOD", "LATE_NIGHT", "LUNCHBOX", "STEAM_AND_SOUP"
  final Location location = Location();
  LocationData? locationData;
  final _serviceEnabled = false.obs;

  @override
  void onInit() {
    super.onInit();
    // 저장된 유저의 위치 불러오기
    getUserLocation();
  }

  void getUserLocation() async {
    PermissionStatus _permissionGranted;
    _serviceEnabled.value = await location.serviceEnabled();

    if (!_serviceEnabled.value) {
      _serviceEnabled.value = await location.requestService();
      if (!_serviceEnabled.value) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    // TODO : 화면 중앙에 마커 띄워놓고 드래그해서 움직여서 자신의 위치 설정해야할듯
    locationData = await location.getLocation();
  }

  String getHTML() {
    return Uri.dataFromString('''
      <html>
      <head>
        <meta name='viewport' content='width=device-width, initial-scale=1.0, user-scalable=yes\'>
        <script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?autoload=true&appkey=${dotenv.env['KAKAO_MAP_KEY']!}&libraries=services"></script>
      </head>
      <body style="padding:0; margin:0;">
        <div id="map" style="width:100%;height:100%;"></div>
        <script>

          var container = document.getElementById('map'); // map for div

          var options = {
            center: new kakao.maps.LatLng(${locationData!.latitude}, ${locationData!.longitude}), // center of map (current position)
            level: 3 // level of map
          };

          // create map
          var map = new kakao.maps.Map(container, options);
          
          kakao.maps.event.addListener(map, 'idle', function() {
                        
              var latLng = map.getCenter();
              
              var centerLatLng = {
                latitude: latLng.getLat(),
                longitude: latLng.getLng()
              }
              
              onIdle.postMessage(JSON.stringify(centerLatLng));
          });

        </script>
      </body>
      </html>
    ''', mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString();
  }

  Set<JavascriptChannel>? get getChannels {
    Set<JavascriptChannel>? channels = {};

    channels.add(JavascriptChannel(
        name: 'onIdle',
        onMessageReceived: (JavascriptMessage message) {
          print(message.message);
          Map<String, dynamic> msgMap = jsonDecode(message.message);
          receivingLocationLat = msgMap["latitude"];
          receivingLocationLng = msgMap["longitude"];
        }));

    if (channels.isEmpty) {
      return null;
    } else {
      return channels;
    }
  }

  void selectNumOfPeopleSelections(int index) {
    limitPerson = index + 2;

    for (int i = 0; i < numOfPeopleSelections.length; i++) {
      if (i == index) {
        numOfPeopleSelections[i] = true;
      } else {
        numOfPeopleSelections[i] = false;
      }
    }
  }

  void setPickedStoreCategory(int index) {
    pickedStoreCategory.value = index;
  }

  String getPickedStoreCategory() {
    return pickedStoreCategory.value != -1
        ? storeCategories[pickedStoreCategory.value].keys.first
        : "";
  }

  Future<bool> registerDeliveryRoom() async {
    try {
      Map deliveryRoomInfo = _getDeliveryRoomInfo();

      if (validateDeliveryRoom(deliveryRoomInfo)) {
        return repository.registerDeliveryRoom(deliveryRoomInfo);
      } else {
        throw Exception("잘못된 정보 입력");
      }
    } catch (e) {
      return false;
    }
  }

  bool validateDeliveryRoom(Map deliveryRoomInfo) {
    return true;
  }

  Map _getDeliveryRoomInfo() {
    Map deliveryRoomInfo = {};

    // 완성
    deliveryRoomInfo["content"] = content.text;
    deliveryRoomInfo["receivingLocation"] = {
      "description": descriptionOfReceivingLocation.text,
      "latitude": receivingLocationLat,
      "longitude": receivingLocationLng,
    };
    deliveryRoomInfo["limitPerson"] = limitPerson;
    deliveryRoomInfo["storeCategory"] =
        storeCategories[pickedStoreCategory.value].values.first;
    deliveryRoomInfo["shareStoreLink"] = storeLink.text;
    deliveryRoomInfo["linkPlatformType"] = _getLinkPlatformType();

    // TODO : 미완성
    deliveryRoomInfo["deliveryTip"];
    deliveryRoomInfo["menuList"];
    deliveryRoomInfo["optionList"];

    print("_getDeliveryRoomInfo: $deliveryRoomInfo");
    return deliveryRoomInfo;
  }

  String _getLinkPlatformType() {
    return "BAEMIN";
  }
}
