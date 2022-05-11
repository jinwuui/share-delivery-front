import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/home/home_controller.dart';
import 'package:share_delivery/src/data/model/delivery_room/delivery_room.dart';

class DeliveryRoomInfo extends GetView<HomeController> {
  const DeliveryRoomInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final DeliveryRoom _deliveryRoom;
    bool onMyDelivery = true;
    if (Get.arguments == null) {
      _deliveryRoom = DeliveryRoom(
        leader: Leader(nickname: "종달새 1호", mannerScore: 36.7),
        content: "BBQ 드실분?",
        person: 1,
        limitPerson: 3,
        storeLink: "www.baemin.com/stores?id=1524",
        platformType: "BAEMIN",
        status: "NULL",
        createdDateTime: DateTime.now(),
        receivingLocation: ReceivingLocation(
            description: "CU 편의점 앞",
            latitude: 35.8113342,
            longitude: 128.5181884),
      );
    } else {
      _deliveryRoom = controller.deliveryRooms.value[Get.arguments];
      onMyDelivery = false;
    }

    return onMyDelivery ? infoOnMyDelivery() : infoOnHome();
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
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.more_vert, color: Colors.black),
          onPressed: () {},
        ),
      ],
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
          style: ElevatedButton.styleFrom(
            primary: Colors.orange,
            textStyle: const TextStyle(fontSize: 17),
            elevation: 0,
            fixedSize: Size(Get.width * 0.7, Get.height * 0.05),
          ),
          onPressed: () {
            // TODO : 모집글 참여 로직 필요
            Get.back();
          },
        ),
      ),
    );
  }

  Widget infoOnMyDelivery() {
    late final DeliveryRoom _deliveryRoom;
    bool onMyDelivery = true;
    if (Get.arguments == null) {
      _deliveryRoom = DeliveryRoom(
        leader: Leader(nickname: "종달새 1호", mannerScore: 36.7),
        content: "BBQ 드실분?",
        person: 1,
        limitPerson: 3,
        storeLink: "www.baemin.com/stores?id=1524",
        platformType: "BAEMIN",
        status: "NULL",
        createdDateTime: DateTime.now(),
        receivingLocation: ReceivingLocation(
            description: "CU 편의점 앞",
            latitude: 35.8113342,
            longitude: 128.5181884),
      );
    } else {
      _deliveryRoom = controller.deliveryRooms.value[Get.arguments];
      onMyDelivery = false;
    }

    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: Get.height * 0.2,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.topLeft,
                child: Text(
                  _deliveryRoom.content,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Divider(height: 15),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "방장",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          _deliveryRoom.leader.nickname,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "매너 온도",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          _deliveryRoom.leader.mannerScore.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(height: 15),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "참여 인원",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          (_deliveryRoom.limitPerson - 1).toString() +
                              " / " +
                              _deliveryRoom.limitPerson.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    // Text(
                    //   "지금 참여하면 배달비  3000 -> 2000",
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.w600,
                    //     fontSize: 20,
                    //   ),
                    // ),
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
                            _deliveryRoom.platformType == "BAEMIN"
                                ? "배민"
                                : "요기요",
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: _deliveryRoom.platformType == "BAEMIN"
                            ? Color.fromRGBO(42, 193, 188, 1)
                            : Color.fromRGBO(249, 0, 80, 1), // NOTE: 요기요 색깔
                        textStyle: const TextStyle(fontSize: 17),
                        elevation: 0,
                        fixedSize: Size(Get.width * 0.7, Get.height * 0.05),
                      ),
                      onPressed: () {
                        // TODO : 모집글 참여 로직 필요
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget infoOnHome() {
    late final DeliveryRoom _deliveryRoom;
    bool onMyDelivery = true;
    if (Get.arguments == null) {
      _deliveryRoom = DeliveryRoom(
        leader: Leader(nickname: "종달새 1호", mannerScore: 36.7),
        content: "BBQ 드실분?",
        person: 1,
        limitPerson: 3,
        storeLink: "www.baemin.com/stores?id=1524",
        platformType: "BAEMIN",
        status: "NULL",
        createdDateTime: DateTime.now(),
        receivingLocation: ReceivingLocation(
            description: "CU 편의점 앞",
            latitude: 35.8113342,
            longitude: 128.5181884),
      );
    } else {
      _deliveryRoom = controller.deliveryRooms.value[Get.arguments];
      onMyDelivery = false;
    }

    return SafeArea(
      child: Scaffold(
        appBar: appBar(),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.grey.shade100,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: Get.height * 0.2,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.topLeft,
                    child: Text(
                      _deliveryRoom.content,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Divider(height: 15),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "방장",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              _deliveryRoom.leader.nickname,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "매너 온도",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              _deliveryRoom.leader.mannerScore.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(height: 15),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "참여 인원",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              (_deliveryRoom.limitPerson - 1).toString() +
                                  " / " +
                                  _deliveryRoom.limitPerson.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        // Text(
                        //   "지금 참여하면 배달비  3000 -> 2000",
                        //   style: TextStyle(
                        //     fontWeight: FontWeight.w600,
                        //     fontSize: 20,
                        //   ),
                        // ),
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
                                _deliveryRoom.platformType == "BAEMIN"
                                    ? "배민"
                                    : "요기요",
                                style: TextStyle(fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: _deliveryRoom.platformType == "BAEMIN"
                                ? Color.fromRGBO(42, 193, 188, 1)
                                : Color.fromRGBO(249, 0, 80, 1), // NOTE: 요기요 색깔
                            textStyle: const TextStyle(fontSize: 17),
                            elevation: 0,
                            fixedSize: Size(Get.width * 0.7, Get.height * 0.05),
                          ),
                          onPressed: () {
                            // TODO : 모집글 참여 로직 필요
                          },
                        ),
                        OutlinedButton(
                          child: Text(
                            "집결지 보러가기",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          style: OutlinedButton.styleFrom(
                            primary: Colors.black,
                            textStyle: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                            elevation: 0,
                            backgroundColor: Colors.white,
                            fixedSize: Size(Get.width * 0.7, Get.height * 0.05),
                          ),
                          onPressed: () {
                            // TODO : 모집글 참여 로직 필요
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomSheet: joinButton(),
      ),
    );
  }
}
