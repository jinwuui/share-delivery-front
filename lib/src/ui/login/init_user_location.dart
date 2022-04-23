import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:share_delivery/src/routes/route.dart';
import 'package:webview_flutter/webview_flutter.dart';

// TODO : StatefulWidget에서 GetXController 구조로 변경할 것
// NOTE : Location 패키지 테스트를 위해 StatefulWidget 으로 잠시 변경

class InitUserLocation extends StatefulWidget {
  const InitUserLocation({Key? key}) : super(key: key);

  @override
  State<InitUserLocation> createState() => _InitUserLocationState();
}

class _InitUserLocationState extends State<InitUserLocation> {
  final Location location = Location();
  LocationData? _locationData;
  bool _serviceEnabled = false;

  Set<JavascriptChannel>? channel; // 아래 설명 참조
  WebViewController? controller;

  @override
  void initState() {
    super.initState();
    refreshLocation();
  }

  void refreshLocation() async {
    PermissionStatus _permissionGranted;
    _serviceEnabled = await location.serviceEnabled();

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
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
    LocationData newLocation = await location.getLocation();
    setState(() {
      _locationData = newLocation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: Border(bottom: BorderSide(color: Colors.black12, width: 1)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text("지도에서 위치 확인", style: TextStyle(color: Colors.black)),
      ),
      body: _locationData != null
          ? Stack(
              children: [
                // KakaoMapView(
                //   width: double.infinity,
                //   height: double.infinity,
                //   kakaoMapKey: dotenv.env['KAKAO_MAP_KEY']!,
                //   lat: _locationData!.latitude ?? 33.450701,
                //   lng: _locationData!.longitude ?? 126.570667,
                //   draggableMarker: true,
                //   cameraIdle: (message) {
                //     print("??");
                //     KakaoLatLng latLng =
                //         KakaoLatLng.fromJson(jsonDecode(message.message));
                //     print('[idle] ${latLng.lat}, ${latLng.lng}');
                //     debugPrint('[idle] ${latLng.lat}, ${latLng.lng}');
                //   },
                // ),
                WebView(
                  initialUrl: _getHTML(),
                  onWebViewCreated: (controller) =>
                      this.controller = controller,
                  javascriptMode: JavascriptMode.unrestricted,
                  javascriptChannels: _getChannels,
                  // TODO :
                  // debuggingEnabled: true,
                  // gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                  //   Factory(() => EagerGestureRecognizer()),
                  // },
                ),
                Center(
                  child: Icon(
                    Icons.location_pin,
                    size: 45,
                    color: Colors.grey[800],
                  ),
                )
              ],
            )
          : Center(child: CircularProgressIndicator()),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 70),
        child: FloatingActionButton.small(
          backgroundColor: Colors.white,
          child: Icon(Icons.location_searching_rounded, color: Colors.black),
          onPressed: () {
            refreshLocation();
          },
        ),
      ),
      bottomSheet: addressSettingBar(),
    );
  }

  Widget addressSettingBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.black12, width: 1))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            width: double.infinity,
            // color: Colors.yellow,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "TODO: 여기에 주소 나와야함",
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
                buttonChangeAddressType(),
              ],
            ),
          ),
          ElevatedButton(
            child: Text("이 위치로 주소 설정"),
            style: ElevatedButton.styleFrom(
              textStyle: TextStyle(fontSize: 17),
              elevation: 0,
              fixedSize: Size(Get.width * 0.9, Get.height * 0.05),
            ),
            onPressed: () {
              Get.toNamed(Routes.PHONE_NUMBER_AUTHENTICATION);
            },
          ),
        ],
      ),
    );
  }

  Widget buttonChangeAddressType() {
    return Container(
      margin: EdgeInsets.only(top: 5),
      width: 120,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(10),
      ),
      child: GestureDetector(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.swap_horiz_rounded), Text("지번으로 보기")],
        ),
        onTap: () {
          print("지번으로 보기 <--> 도로명으로 보기");
        },
      ),
    );
  }

  String _getHTML() {
    return Uri.dataFromString('''
      <html>
      <head>
        <meta name='viewport' content='width=device-width, initial-scale=1.0, user-scalable=yes\'>
        <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?autoload=true&appkey=${dotenv.env['KAKAO_MAP_KEY']!}"></script>
      </head>
      <body style="padding:0; margin:0;">
        <div id="map" style="width:100%;height:100%;"></div>
        <script>
          var container = document.getElementById('map');
          
          var options = {
            center: new kakao.maps.LatLng(33.450701, 126.570667),
            level: 3
          };
      
          var map = new kakao.maps.Map(container, options);
          
        </script>
      </body>
      </html>
    ''', mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString();
  }

  Set<JavascriptChannel>? get _getChannels {
    Set<JavascriptChannel>? channels = {};
    // if (onTapMarker != null) {
    //   channels.add(JavascriptChannel(
    //       name: 'onTapMarker', onMessageReceived: onTapMarker!));
    // }
    //
    // if (zoomChanged != null) {
    //   channels.add(JavascriptChannel(
    //       name: 'zoomChanged', onMessageReceived: zoomChanged!));
    // }
    //
    // if (cameraIdle != null) {
    //   channels.add(JavascriptChannel(
    //       name: 'cameraIdle', onMessageReceived: cameraIdle!));
    // }
    //
    // if (boundaryUpdate != null) {
    //   channels.add(JavascriptChannel(
    //       name: 'boundaryUpdate', onMessageReceived: boundaryUpdate!));
    // }

    if (channels.isEmpty) {
      return null;
    }

    return channels;
  }
}
