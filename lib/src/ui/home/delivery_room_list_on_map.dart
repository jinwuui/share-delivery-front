import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';

class DeliveryRoomListOnMap extends StatelessWidget {
  const DeliveryRoomListOnMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("지도 조회"),
      ),
      body: KakaoMapView(
        width: double.infinity,
        height: 400,
        kakaoMapKey: dotenv.env['KAKAO_MAP_KEY']!,
        lat: 33.450701,
        lng: 126.570667,
      ),
    );
  }
}
