import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryRoomRegister extends StatelessWidget {
  const DeliveryRoomRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () => Get.back(),
          child: const Text("닫기"),
        ),
        title: const Text("배달 모집글 등록"),
        actions: [
          TextButton(
            onPressed: () {
              // TODO: 모집글 등록 로직 필요
              print("모집글 등록 로직 필요");
              Get.back();
            },
            child: const Text("완료"),
          ),
        ],
      ),
      body: detailSetting(),
    );
  }

  Widget detailSetting() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(border: Border.all(width: 0.5)),
            child: TextField(
              minLines: 2,
              maxLines: 2,
              decoration: InputDecoration(hintText: "글"),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(border: Border.all(width: 0.5)),
                  child: TextField(
                    decoration: InputDecoration(hintText: "배달 가게 링크"),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  // TODO : 클립보드 복사 로직 필요
                },
                child: const Text("클립보드 복사"),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(width: 0.5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("참여 인원"),
                TextButton(onPressed: () {}, child: Text("2")),
                TextButton(onPressed: () {}, child: Text("3")),
                TextButton(onPressed: () {}, child: Text("4")),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(width: 0.5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(hintText: "집결지"),
                  ),
                ),
                TextButton(onPressed: () {}, child: Text("설정"))
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(width: 0.5)),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(hintText: "마감 시간"),
                  ),
                ),
                Text(
                  "TODO: 마감시간 picker 필요",
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
