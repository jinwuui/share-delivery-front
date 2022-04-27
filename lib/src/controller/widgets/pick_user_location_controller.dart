import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PickUserLocationController extends GetxController {
  final Location location = Location();
  LocationData? locationData;
  RxBool _serviceEnabled = false.obs;
  RxBool centerMarker = false.obs;

  @override
  void onInit() {
    super.onInit();
    refreshLocation();
  }

  void refreshLocation() async {
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
    print(locationData.toString());
    update();
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
          
          var geocoder = new kakao.maps.services.Geocoder();

          kakao.maps.event.addListener(map, 'idle', function() {
                        
              var latlng = map.getCenter();
              
              var centerLatLng = {
                lat: latlng.getLat(),
                lng: latlng.getLng()
              }
              
              onIdle.postMessage(JSON.stringify(centerLatLng));
          });
          
          
          kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
              // var latlng = map.getCenter();
              // searchDetailAddrFromCoords(latlng, function(result, status) {
              //     onClick.postMessage(status);
              //    
              //     if (status === kakao.maps.services.Status.OK) {
              //         var detailAddr = !!result[0].road_address ? 'addr : ' + result[0].road_address.address_name + ' ' : '';
              //         detailAddr += 'addr2 : ' + result[0].address.address_name + ' ';
              //        
              //         onClick.postMessage("onClick");
              //     } else {
              //        onClick.postMessage("onClick else");
              //     }
              // });
              geocoder.addressSearch("대구광역시 달서구 조암로 149", function(result, status) {
                // onClick.postMessage(status);
                if (status === kakao.maps.services.Status.OK) {
                  var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                  var marker = new kakao.maps.Marker({ map: map, position: coords, });
                  // var infowindow = new kakao.maps.InfoWindow({ content: '<div style="width:150px;text-align:center;padding:6px 0;">Kakao</div>', });
                  // infowindow.open(map, marker);
                  map.setCenter(coords);
                  // onClick.postMessage("addr ok");
                } else {
                  // onClick.postMessage("addr else");
                }
              });
          });
          

          
          function searchDetailAddrFromCoords(coords, callback) {
              try {
                geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
                onClick.postMessage("not error");
              } catch (e) {
                onClick.postMessage(e);
              } 
          }

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
}
