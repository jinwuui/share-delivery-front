import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/home/home_controller.dart';
import 'package:share_delivery/src/data/model/delivery_room/delivery_room/delivery_room.dart';
import 'package:share_delivery/src/routes/route.dart';
import 'package:share_delivery/src/ui/theme/button_theme.dart';
import 'package:share_delivery/src/ui/theme/container_theme.dart';
import 'package:share_delivery/src/ui/theme/text_theme.dart';
import 'package:share_delivery/src/ui/widgets/show_specific_spot.dart';
import 'package:share_plus/share_plus.dart';

class DeliveryRoomInfo extends GetView<HomeController> {
  // late int index;
  // late var controller;

  const DeliveryRoomInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // if (Get.arguments == null) {
    //   return Center(child: CircularProgressIndicator());
    // }
    //
    // print('DeliveryRoomInfo.build');
    // index = Get.arguments["index"];
    // print("index: $index");
    // controller = Get.arguments["controller"];
    // print("controller: $controller");

    return SafeArea(
      child: Scaffold(
        appBar: appBar(),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.grey.shade100,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: roomInfo(),
          ),
        ),
        bottomSheet: joinButton(),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_rounded, color: Colors.black),
        onPressed: () => Get.back(),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.share, color: Colors.black),
          onPressed: () async {
            print('DeliveryRoomInfo.appBar - share');
            final result = await Share.shareWithResult("www.naver.com");

            print(result.status);
          },
        ),
        IconButton(
          icon: Icon(Icons.more_vert, color: Colors.black),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget roomInfo() {
    DeliveryRoom deliveryRoom = controller.getDeliveryRoomInfo();

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: Get.height * 0.2,
            padding: const EdgeInsets.all(10),
            decoration: deliveryRoomInfoBox,
            alignment: Alignment.topLeft,
            child: Text(deliveryRoom.content, style: titleTextStyle),
          ),
          Divider(height: 15),
          Container(
            padding: EdgeInsets.all(10),
            decoration: deliveryRoomInfoBox,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("방장", style: infoTextStyle),
                    Text(deliveryRoom.leader.nickname, style: infoTextStyle),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("매너 온도", style: infoTextStyle),
                    Text(
                      "${deliveryRoom.leader.mannerScore}",
                      style: infoTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(height: 15),
          Container(
            padding: EdgeInsets.all(10),
            decoration: deliveryRoomInfoBox,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("참여 인원", style: infoTextStyle),
                    Text(
                      (deliveryRoom.limitPerson - 1).toString() +
                          " / " +
                          deliveryRoom.limitPerson.toString(),
                      style: infoTextStyle,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("예상 배달비", style: infoTextStyle),
                    Text("${deliveryRoom.deliveryTip}", style: infoTextStyle),
                  ],
                ),
              ],
            ),
          ),
          Divider(height: 15),
          Center(
            child: Column(
              children: [
                ElevatedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "음식점 보러가기",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Icon(Icons.east),
                      Text(
                        deliveryRoom.platformType == "BAEMIN" ? "배민" : "요기요",
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: deliveryRoom.platformType == "BAEMIN"
                        ? Color.fromRGBO(42, 193, 188, 1)
                        : Color.fromRGBO(249, 0, 80, 1), // NOTE: 요기요 색깔
                    textStyle: const TextStyle(fontSize: 17),
                    elevation: 0,
                    fixedSize: Size(Get.width * 0.7, Get.height * 0.05),
                  ),
                  onPressed: () {
                    // TODO : deep link 로 배달앱 켜주는 기능 필요
                  },
                ),
                OutlinedButton(
                  child: Text(
                    "집결지 보기",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  style: whiteBtn,
                  onPressed: () {
                    // TODO : 집결지 보여주는 기능 필요
                    Get.bottomSheet(
                      ShowSpecificSpot(spot: deliveryRoom.receivingLocation),
                      isScrollControlled: true,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget joinButton() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.black12, width: 1),
        ),
      ),
      height: 70,
      width: double.infinity,
      child: Center(
        child: ElevatedButton(
          child: const Text(
            "지금 참여하기",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          style: orangeBtn,
          onPressed: () {
            // TODO : 모집글 참여 로직 필요
            Get.toNamed(
              Routes.PARTICIPATE_ROOM,
              arguments: controller.getDeliveryRoomInfo(),
            );
          },
        ),
      ),
    );
  }
}
