import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/widgets/pick_user_location_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PickUserLocation extends GetView<PickUserLocationController> {
  const PickUserLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            shape: const Border(
              bottom: BorderSide(color: Colors.black12, width: 1),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(Icons.close_rounded, color: Colors.black),
              onPressed: () => Get.back(),
            ),
            title:
                const Text("지도에서 위치 확인", style: TextStyle(color: Colors.black)),
          ),
          body: controller.isPrepared.value
              ? Stack(
                  children: [
                    WebView(
                      // initialUrl: "https://www.naver.com",
                      initialUrl: controller.getHTML(),
                      onWebViewCreated: (ctrl) =>
                          controller.setWebViewController(ctrl),
                      javascriptMode: JavascriptMode.unrestricted,
                      javascriptChannels: controller.getChannels,
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
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(color: Colors.grey),
                ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 70),
            child: FloatingActionButton.small(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              child: const Icon(Icons.location_searching_rounded),
              onPressed: () => controller.reloadWebView(),
            ),
          ),
          bottomSheet: addressSettingBar(),
        ),
      ),
    );
  }

  Widget addressSettingBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      height: 140,
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.black12, width: 1),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            width: Get.width * 0.9,
            height: Get.height * 0.07,
            child: TextField(
              maxLength: 13,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(left: 15.0),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
                hintText: "내 위치 (ex. 집, 회사)",
                counterText: "",
              ),
            ),
          ),
          // Container(
          //   padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          //   width: double.infinity,
          //   // color: Colors.yellow,
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       const Text(
          //         "TODO: 여기에 주소 나와야함",
          //         style: TextStyle(
          //             decoration: TextDecoration.lineThrough,
          //             color: Colors.red,
          //             fontWeight: FontWeight.w700,
          //             fontSize: 20),
          //       ),
          //       buttonChangeAddressType(),
          //     ],
          //   ),
          // ),
          ElevatedButton(
            child: const Text("이 위치로 설정"),
            style: ElevatedButton.styleFrom(
              primary: Colors.orange,
              textStyle: const TextStyle(fontSize: 17),
              elevation: 0,
              fixedSize: Size(Get.width * 0.9, Get.height * 0.05),
            ),
            onPressed: () {
              controller.saveLocationDataToLocal();
              if (Get.arguments == null) {
                Get.back();
              } else {
                Get.toNamed(Get.arguments);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget buttonChangeAddressType() {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      width: 120,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(10),
      ),
      child: GestureDetector(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
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
