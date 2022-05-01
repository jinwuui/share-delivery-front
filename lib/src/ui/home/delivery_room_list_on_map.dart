import 'package:flutter/material.dart';
import 'package:share_delivery/src/ui/ui_comment.dart';

class DeliveryRoomListOnMap extends StatelessWidget {
  const DeliveryRoomListOnMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("지도 조회"),
      ),
      body: Center(
        child: UIComment(content: "TODO : 지도 필요\n마커 클릭하면\n모집글 요약 정보 하단 출력"),
      ),
    );
  }
}
