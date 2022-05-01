import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:share_delivery/src/data/repository/delivery_room_register_repository.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DeliveryRoomRegisterController extends GetxController {
  final DeliveryRoomRegisterRepository repository;

  DeliveryRoomRegisterController({required this.repository});

  // 모집글 등록을 위한 상세 정보
  final RxList<bool> numOfPeopleSelections = <bool>[true, false, false].obs;
  final RxList<bool> limitTimeSelections = <bool>[true, false, false].obs;

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
                        
              var latlng = map.getCenter();
              
              var centerLatLng = {
                lat: latlng.getLat(),
                lng: latlng.getLng()
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
        }));

    if (channels.isEmpty) {
      return null;
    } else {
      return channels;
    }
  }

  void selectNumOfPeopleSelections(int index) {
    for (int i = 0; i < numOfPeopleSelections.length; i++) {
      if (i == index) {
        numOfPeopleSelections[i] = true;
      } else {
        numOfPeopleSelections[i] = false;
      }
    }
  }

  void selectLimitTimeSelections(int index) {
    for (int i = 0; i < limitTimeSelections.length; i++) {
      if (i == index) {
        limitTimeSelections[i] = true;
      } else {
        limitTimeSelections[i] = false;
      }
    }
  }
}
