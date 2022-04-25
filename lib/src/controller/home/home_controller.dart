import 'dart:convert';
import 'dart:ui';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeController extends GetxController {
  RxList<Offset> roomList =
      <Offset>[Offset(35.81895264358996, 128.51600027201349)].obs;

  final Location location = Location();
  LocationData? locationData;
  var _serviceEnabled = false.obs;
  RxInt count = 0.obs;

  void increase() {
    count++;
  }

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
          
          // create marker
          var markerPosition  = new kakao.maps.LatLng(${locationData!.latitude}, ${locationData!.longitude});
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

  String getDeliveryRoomHTML() {
    String positions = "";
    for (Offset offset in roomList) {
      positions += "new kakao.maps.LatLng(${offset.dx}, ${offset.dy}),";
    }

    return '''
        var positions = [
          $positions
        ];
    
        var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
            
        for (var i = 0; i < positions.length; i ++) {
            
            var imageSize = new kakao.maps.Size(24, 35); 
            
            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
            
            var marker = new kakao.maps.Marker({
                map: map,
                position: positions[i],
                image : markerImage
            });
        }
    ''';
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
}
