import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ReceivingLocationController extends GetxController {
  ReceivingLocationController();

  static ReceivingLocationController get to => Get.find();

  RxList<Offset> roomList = <Offset>[
    Offset(35.81891264358996, 128.51603017201349),
    Offset(35.81892254358912, 128.51606027201323),
    Offset(35.81894234358266, 128.51607037201353),
    Offset(35.81835244358914, 128.516080472013467),
    Offset(35.81865274358923, 128.516010572013345),
    Offset(35.81875294358922, 128.5160306720134),
    Offset(35.8188527335896, 128.51604527201338),
    Offset(35.81895264358900, 128.51630087201323),
    Offset(35.81815264358936, 128.5167001227201345),
  ].obs;

  // 사용자 위치 관련
  final Location location = Location();
  Rx<LocationData> locationData = LocationData.fromMap({"isMock": true}).obs;
  final RxBool _serviceEnabled = false.obs;

  // 웹뷰 관련
  Rx<Completer<WebViewController>> webViewController =
      Completer<WebViewController>().obs;
  RxBool isPrepared = false.obs;

  @override
  void onInit() {
    super.onInit();
    // TODO: 모집글 수령위치로 변경
    getUserLocation();
  }

  // 사용자 위치 불러오기
  void getUserLocation() async {
    locationData.value = await location.getLocation();
    isPrepared.value = true;
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
          
          // create marker
          var markerPosition  = new kakao.maps.LatLng(${locationData.value.latitude}, ${locationData.value.longitude});
          var marker = new kakao.maps.Marker({
              position: markerPosition
          });
          
          marker.setMap(map);
          
          
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

  // WebView JS Listener
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

  void setWebViewController(WebViewController webViewController) {
    this.webViewController.value.complete(webViewController);
  }

  void reloadWebView() {
    webViewController.value.future.then((value) async {
      value.reload();
    });
  }
}
