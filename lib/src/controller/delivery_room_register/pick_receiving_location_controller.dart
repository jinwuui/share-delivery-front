import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:share_delivery/src/controller/delivery_room_register/delivery_room_register_controller.dart';
import 'package:share_delivery/src/data/model/delivery_room/delivery_room/delivery_room.dart';
import 'package:share_delivery/src/data/repository/delivery_room_register/pick_receiving_location_repository.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PickReceivingLocationController extends GetxController {
  PickReceivingLocationRepository repository;

  PickReceivingLocationController({required this.repository});

  // 웹뷰 관련
  Rx<Completer<WebViewController>> webViewController =
      Completer<WebViewController>().obs;
  RxBool isPrepared = false.obs;

  // 저장된 집결지
  final histories = <ReceivingLocation>[].obs;

  // 집결 위치 관련 정보
  final Location location = Location();
  Rx<LocationData> locationData = LocationData.fromMap({"isMock": true}).obs;
  final _serviceEnabled = false.obs;
  RxInt curPage = 0.obs; // pick_receiving_location_controller.dart 의 페이지 인덱스
  final TextEditingController locationDescription = TextEditingController();
  RxBool isDescriptionEmpty = true.obs;
  double receivingLocationLat = -1.0;
  double receivingLocationLng = -1.0;

  @override
  void onInit() {
    super.onInit();
    // 집결지 기록 가져오기
    findReceivingLocationHistory();

    // 현재 유저의 위치 불러오기
    refreshLocation();
  }

  void findReceivingLocationHistory() {
    histories.value = repository.find();
  }

  // 사용자 위치 불러오기
  Future<void> refreshLocation() async {
    if (await verifyLocationPermission()) {
      locationData.value = await location.getLocation();
      receivingLocationLat = locationData.value.latitude!;
      receivingLocationLng = locationData.value.longitude!;
      locationDescription.text = "";
      await Future.delayed(Duration(milliseconds: 500));
      isPrepared.value = true;
    } else {
      print("ERROR: 위치 정보 엑세스 권한 없음");
    }
  }

  // 위치 정보 엑세스 권한 검증
  Future<bool> verifyLocationPermission() async {
    PermissionStatus _permissionGranted;
    _serviceEnabled.value = await location.serviceEnabled();

    if (!_serviceEnabled.value) {
      _serviceEnabled.value = await location.requestService();
      if (!_serviceEnabled.value) {
        return false;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return false;
      }
    }

    return true;
  }

  String getHTML() {
    return Uri.dataFromString('''
      <html>
      <head>
        <meta name='viewport' content='width=device-width, initial-scale=1.0, user-scalable=yes'>
        <script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?autoload=true&appkey=${dotenv.env['KAKAO_MAP_KEY']!}&libraries=services"></script>
      </head>
      <body style="padding:0; margin:0;">
        <div id="map" style="width:100%;height:100%;"></div>
        <script>

          var container = document.getElementById('map'); // map for div

          var options = {
            center: new kakao.maps.LatLng(${locationData.value.latitude}, ${locationData.value.longitude}), // center of map (current position)
            level: 3 // level of map
          };
          
          // create map
          var map = new kakao.maps.Map(container, options);
          
          // create marker
          var markerPosition  = new kakao.maps.LatLng(${locationData.value.latitude}, ${locationData.value.longitude});
          var marker = new kakao.maps.Marker({
              position: markerPosition
          });
          
          marker.setMap(map);
          
          
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

  void setWebViewController(WebViewController webViewController) {
    if (!this.webViewController.value.isCompleted) {
      this.webViewController.value.complete(webViewController);
    }
    reloadWebView();
  }

  void completePickLocation() {
    String description = locationDescription.text;
    double latitude = receivingLocationLat;
    double longitude = receivingLocationLng;

    repository.register(description, latitude, longitude);
    final controller = Get.find<DeliveryRoomRegisterController>();
    controller.setReceivingLocation(description, latitude, longitude);
  }

  void reloadWebView() {
    webViewController.value.future.then((value) async {
      value.reload();
      value.loadUrl(getHTML());
    });
  }

  void moveSecondPage() {
    curPage.value = 1;
  }

  void moveFirstPage() {
    curPage.value = 0;
  }

  void setIsDescriptionEmpty(String text) {
    isDescriptionEmpty.value = text.trim().isEmpty;
  }

  bool isFirstPage() {
    return curPage.value == 0;
  }

  void changeToLocationHistory(ReceivingLocation location) {
    locationData.value = LocationData.fromMap(
        {"latitude": location.latitude, "longitude": location.longitude});

    locationDescription.text = location.description;
    setIsDescriptionEmpty(locationDescription.text);
    receivingLocationLat = location.latitude;
    receivingLocationLng = location.longitude;
  }

  void changeToCurrentLocation() {
    // refreshLocation();
  }
}
