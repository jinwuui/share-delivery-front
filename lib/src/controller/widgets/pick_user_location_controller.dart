import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:share_delivery/src/controller/home/home_controller.dart';
import 'package:share_delivery/src/data/repository/pick_user_location_repository.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PickUserLocationController extends GetxController {
  static PickUserLocationController get to => Get.find();

  final PickUserLocationRepository repository;

  PickUserLocationController({required this.repository});

  // 사용자 위치 관련
  final Location location = Location();
  Rx<LocationData> locationData = LocationData.fromMap({"isMock": true}).obs;
  final RxBool _serviceEnabled = false.obs;
  final TextEditingController locationDescription = TextEditingController();

  // 웹뷰 관련
  Rx<Completer<WebViewController>> webViewController =
      Completer<WebViewController>().obs;
  RxBool isPrepared = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    // 사용자의 위치 불러오기
    await refreshLocation();
  }

  // 사용자 위치 불러오기
  Future<void> refreshLocation() async {
    if (await verifyLocationPermission()) {
      locationData.value = await location.getLocation();
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

  // 카카오 지도 JS API 로 지도 띄우기
  String getHTML() {
    return Uri.dataFromString('''
      <html>
      <head>
        <meta name='viewport' content='width=device-width, initial-scale=1.0, user-scalable=yes\'>
        <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?autoload=true&appkey=${dotenv.env['KAKAO_MAP_KEY']!}&libraries=services"></script>
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

  // WebView JS Listener
  Set<JavascriptChannel>? get getChannels {
    Set<JavascriptChannel>? channels = {};

    channels.add(JavascriptChannel(
        name: 'onIdle',
        onMessageReceived: (JavascriptMessage message) {
          Map<String, dynamic> latLngMap = jsonDecode(message.message);
          locationData.value = LocationData.fromMap(latLngMap);
          print("onIdle");
        }));

    channels.add(JavascriptChannel(
        name: 'onClick',
        onMessageReceived: (JavascriptMessage message) {
          print(message.message);
        }));

    if (channels.isEmpty) {
      return null;
    } else {
      return channels;
    }
  }

  void setWebViewController(WebViewController webViewController) {
    this.webViewController.value.complete(webViewController);
    reloadWebView();
  }

  void reloadWebView() {
    webViewController.value.future.then((value) async {
      value.reload();
    });
  }

  void saveLocationDataToLocal() {
    print("-- 사용자가 선택한 위치를 로컬에 저장");
    repository.saveLocationDataToLocal(
        locationDescription.text, locationData.value);

    HomeController homeController = Get.find();
    homeController.reloadWebView();
  }

  void changePage(String? next) {
    if (next == null) {
      Get.back();
    } else {
      Get.toNamed(Get.arguments);
    }
  }
}
