import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';
import 'package:location/location.dart';

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

  @override
  void initState() {
    super.initState();
    print("initState");
    initLocation();
  }

  void initLocation() async {
    print("initLocation");
    PermissionStatus _permissionGranted;
    _locationData;
    _serviceEnabled = await location.serviceEnabled();
    print("1");
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    print("2");
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    print("3");
    setState(() async {
      _locationData = await location.getLocation();
    });
    print("4");
    print("end - initLocation");
  }

  @override
  Widget build(BuildContext context) {
    return _locationData != null
        ? Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () => Get.back(),
              ),
              title: Text("내 위치 설정", style: TextStyle(color: Colors.black)),
            ),
            body: KakaoMapView(
              width: double.infinity,
              height: 400,
              kakaoMapKey: dotenv.env['KAKAO_MAP_KEY']!,
              lat: _locationData!.latitude ?? 33.450701,
              lng: _locationData!.longitude ?? 126.570667,
            ),
          )
        : CircularProgressIndicator();
  }
}
