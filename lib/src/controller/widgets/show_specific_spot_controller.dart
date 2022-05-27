import 'dart:async';
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/data/model/delivery_room/delivery_room/delivery_room.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ShowSpecificSpotController extends GetxController {
  final ReceivingLocation spot;

  ShowSpecificSpotController({required this.spot});

  // 웹뷰 관련
  Rx<Completer<WebViewController>> webViewController =
      Completer<WebViewController>().obs;

  // 카카오 지도 JS API 로 지도 띄우기
  String getHTML() {
    print('ShowSpecificSpotController.getHTML ${spot.lat}, ${spot.lng}');
    return Uri.dataFromString('''
      <html>
      <head>
        <meta name='viewport' content='width=device-width, initial-scale=1.0, user-scalable=yes'>
        <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?autoload=true&appkey=${dotenv.env['KAKAO_MAP_KEY']!}&libraries=services"></script>
      </head>
      <body style="padding:0; margin:0;">
        <div id="map" style="width:100%;height:100%;"></div>
        <script>

          var container = document.getElementById('map'); // map for div

          var options = {
            center: new kakao.maps.LatLng(${spot.lat}, ${spot.lng}), // center of map (current position)
            level: 3 // level of map
          };
          
          // create map
          var map = new kakao.maps.Map(container, options);
          
          
          
          // set marker position
          var markerPosition  = new kakao.maps.LatLng(${spot.lat}, ${spot.lng}); 
          
          // create marker
          var marker = new kakao.maps.Marker({
              position: markerPosition
          });
          
          // set marker on map
          marker.setMap(map);
          
          var iwContent = '<div style="padding:5px; font-family:arial;">${spot.description}</div>';
          var iwPosition = new kakao.maps.LatLng(${spot.lat}, ${spot.lng});

          // 인포윈도우를 생성합니다
          var infowindow = new kakao.maps.InfoWindow({
              position : iwPosition,
              content : iwContent 
          });
            
          // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
          infowindow.open(map, marker); 

        </script>
      </body>
      </html>
    ''', mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString();
  }

  // WebView JS Listener
  Set<JavascriptChannel>? get getChannels {
    Set<JavascriptChannel>? channels = {};

    if (channels.isEmpty) {
      return null;
    } else {
      return channels;
    }
  }

  void setWebViewController(WebViewController webViewController) {
    this.webViewController.value.complete(webViewController);
    // reloadWebView();
  }

  void reloadWebView() {
    webViewController.value.future.then((value) async {
      await value.reload();
    });
  }
}
