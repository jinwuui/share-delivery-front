import 'package:flutter/material.dart';

class DeliveryRoomDetail extends StatelessWidget {
  const DeliveryRoomDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("상세조회"),
      ),
      body: const Center(
        child: Text("딜리버리 룸 상세정보 조회"),
      ),
    );
  }
}
