import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FastMatching extends StatelessWidget {
  const FastMatching({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Center(
        child: Wrap(
          children: [
            Text("관심 음식 태그 고를것 -> 등록 끝나면 현 화면에서 매칭 바로 스타트"),
            Text("매칭 완료되면 offNamedUntil 뭐시기 써서 '내 배달' 에 채팅방 만들어서 거기로 바로 보내주기 "),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      shape: const Border(bottom: BorderSide(color: Colors.black12, width: 1)),
      elevation: 0,
      backgroundColor: Colors.white,
      leading: TextButton(
        onPressed: () => Get.back(),
        child: const Text("닫기", style: TextStyle(color: Colors.black)),
      ),
      title: const Text(
        "빠른 매칭 시작하기",
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: Text("시작"),
        ),
      ],
    );
  }
}
