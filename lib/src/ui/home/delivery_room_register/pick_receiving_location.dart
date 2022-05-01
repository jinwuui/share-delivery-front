import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/delivery_room_register/delivery_room_register_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PickReceivingLocation extends StatefulWidget {
  const PickReceivingLocation({Key? key}) : super(key: key);

  @override
  State<PickReceivingLocation> createState() => _PickReceivingLocationState();
}

class _PickReceivingLocationState extends State<PickReceivingLocation> {
  WebViewController? webViewController;

  late Widget _myAnimatedWidget;

  @override
  void initState() {
    _myAnimatedWidget = page1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      height: Get.height * 0.9,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: _myAnimatedWidget,
      ),
    );
  }

  Widget page1() {
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => Get.back(),
          child: SizedBox(
            width: double.infinity,
            child: Icon(Icons.horizontal_rule, size: 30),
          ),
        ),
        moveToMap(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(
                20,
                (index) => locationRecord(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget page2() {
    return GetBuilder<DeliveryRoomRegisterController>(
        builder: (controller) => Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  height: 45,
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.black12, width: 1))),
                  child: Stack(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_rounded),
                        onPressed: () {
                          setState(() {
                            _myAnimatedWidget = page1();
                          });
                        },
                      ),
                      Center(
                        child: Text(
                          "지도에서 집결지 설정",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: controller.locationData != null
                      ? Stack(
                          children: [
                            WebView(
                              initialUrl: controller.getHTML(),
                              onWebViewCreated: (ctrl) =>
                                  webViewController = ctrl,
                              javascriptMode: JavascriptMode.unrestricted,
                              javascriptChannels: controller.getChannels,
                              gestureRecognizers: Set()
                                ..add(Factory<VerticalDragGestureRecognizer>(
                                    () => VerticalDragGestureRecognizer())),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 40),
                              child: Center(
                                child: Icon(
                                  Icons.location_pin,
                                  size: 50,
                                  color: Colors.grey[800],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: FloatingActionButton.small(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                child: Icon(Icons.location_searching_rounded),
                                onPressed: () {
                                  controller.getUserLocation();
                                  webViewController!.reload();
                                },
                              ),
                            ),
                          ],
                        )
                      : Center(child: CircularProgressIndicator()),
                ),
                addressSettingBar(),
              ],
            ));
  }

  Widget moveToMap() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        setState(() {
          _myAnimatedWidget = page2();
        });
        print("지도로 설정 터치 체크");
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        color: Colors.grey.shade200,
        width: double.infinity,
        height: 45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Icon(Icons.gps_fixed_rounded),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text("지도로 설정"),
              )
            ]),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }

  Widget locationRecord() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        print("이전 위치 텍스트 터치 체크");
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            width: double.infinity,
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.place_outlined),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text("이전 위치 히스토리"),
                ),
              ],
            ),
          ),
          Divider(
            height: 0,
            indent: 50,
          ),
        ],
      ),
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
                      decoration: TextDecoration.lineThrough,
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
                buttonChangeAddressType(),
              ],
            ),
          ),
          ElevatedButton(
            child: Text("이 위치로 설정"),
            style: ElevatedButton.styleFrom(
              textStyle: TextStyle(fontSize: 17),
              elevation: 0,
              fixedSize: Size(Get.width * 0.9, Get.height * 0.05),
            ),
            onPressed: () {
              Get.back();
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
          children: [
            Icon(Icons.swap_horiz_rounded),
            Text(
              "지번으로 보기",
              style: TextStyle(decoration: TextDecoration.lineThrough),
            )
          ],
        ),
        onTap: () {
          print("지번으로 보기 <--> 도로명으로 보기");
        },
      ),
    );
  }
}
