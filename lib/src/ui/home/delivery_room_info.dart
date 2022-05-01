import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/home/home_controller.dart';

class DeliveryRoomInfo extends GetView<HomeController> {
  const DeliveryRoomInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Colors.red,
                    child: Text(
                      "모집글 내용모집글 내용모집글 내용모집글 내용모집글 내용",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Divider(height: 15),
                  Container(
                    color: Colors.yellow,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "모집 마감",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "10:58",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
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
                              "2 / 3",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(height: 15),
                  Container(
                    color: Colors.green,
                    child: Column(
                      children: [
                        Text(
                          "지금 참여하면 배달비  3000 -> 2000",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
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
                                "배민",
                                style: TextStyle(fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(42, 193, 188, 1),
                            // primary: Color.fromRGBO(249, 0, 80, 1), // NOTE: 요기요 색깔
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
          },
        ),
      ),
    );
  }
}
