import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/delivery_room_register/pick_receiving_location_controller.dart';
import 'package:share_delivery/src/data/model/delivery_room/delivery_room/delivery_room.dart';
import 'package:share_delivery/src/ui/theme/text_theme.dart';
import 'package:webview_flutter/webview_flutter.dart';

// class PickReceivingLocation extends StatefulWidget {
//   const PickReceivingLocation({Key? key}) : super(key: key);
//
//   @override
//   State<PickReceivingLocation> createState() => _PickReceivingLocationState();
// }
//
// class _PickReceivingLocationState extends State<PickReceivingLocation> {
//   WebViewController? webViewController;
//
//   late Widget _myAnimatedWidget;
//
//   @override
//   void initState() {
//     _myAnimatedWidget = page1();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(15),
//           topRight: Radius.circular(15),
//         ),
//       ),
//       height: Get.height * 0.9,
//       child: AnimatedSwitcher(
//         transitionBuilder: ,
//         switchInCurve: Curves,
//         duration: const Duration(milliseconds: 200),
//         child: controller.pageIndex == 0 ? page1(), page2(),
//       ),
//     );
//   }
//
//   Widget page1() {
//     return Column(
//       children: [
//         GestureDetector(
//           behavior: HitTestBehavior.translucent,
//           onTap: () => Get.back(),
//           child: SizedBox(
//             width: double.infinity,
//             child: Icon(Icons.horizontal_rule, size: 30),
//           ),
//         ),
//         moveToMap(),
//         Expanded(
//           child: SingleChildScrollView(
//             child: Column(
//               children: List.generate(
//                 20,
//                 (index) => locationRecord(),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget page2() {
//     return GetBuilder<DeliveryRoomRegisterController>(
//         builder: (controller) => Column(
//               children: [
//                 ,
//                 addressSettingBar(),
//               ],
//             ),);
//   }
//
//   Widget moveToMap() {
//     return GestureDetector(
//       behavior: HitTestBehavior.translucent,
//       onTap: () {
//         setState(() {
//           _myAnimatedWidget = page2();
//         });
//         print("지도로 설정 터치 체크");
//       },
//       child: Container(
//         padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
//         color: Colors.grey.shade200,
//         width: double.infinity,
//         height: 45,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(children: [
//               Icon(Icons.gps_fixed_rounded),
//               Padding(
//                 padding: const EdgeInsets.only(left: 10),
//                 child: Text("지도로 설정"),
//               )
//             ]),
//             Icon(Icons.arrow_forward_ios),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget moveToList() {
//     return Column(children: [ SizedBox(
//       width: double.infinity,
//       height: 30,
//     ),
//       Container(
//         width: double.infinity,
//         height: 45,
//         padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
//         decoration: BoxDecoration(
//             border: Border(
//                 bottom: BorderSide(color: Colors.black12, width: 1))),
//         child: Stack(
//           children: [
//             IconButton(
//               icon: Icon(Icons.arrow_back_rounded),
//               onPressed: () {
//                 setState(() {
//                   _myAnimatedWidget = page1();
//                 });
//               },
//             ),
//             Center(
//               child: Text(
//                 "지도에서 집결지 설정",
//                 style: TextStyle(
//                     fontWeight: FontWeight.w800, fontSize: 15),
//               ),
//             ),
//           ],
//         ),
//       ),],);
//   }
//
//   Widget locationRecord() {
//     return GestureDetector(
//       behavior: HitTestBehavior.translucent,
//       onTap: () {
//         print("이전 위치 텍스트 터치 체크");
//       },
//       child: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
//             width: double.infinity,
//             height: 70,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Icon(Icons.place_outlined),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10),
//                   child: Text("이전 위치 히스토리"),
//                 ),
//               ],
//             ),
//           ),
//           Divider(
//             height: 0,
//             indent: 50,
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget addressSettingBar() {
//     return Container(
//       padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
//       height: 140,
//       width: double.infinity,
//       decoration: BoxDecoration(
//           border: Border(top: BorderSide(color: Colors.black12, width: 1))),
//       child: GetBuilder<DeliveryRoomRegisterController>(
//         builder: (controller) => Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Container(
//               margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
//               width: Get.width * 0.9,
//               height: Get.height * 0.07,
//               child: TextField(
//                 controller: controller.descriptionOfReceivingLocation,
//                 maxLength: 13,
//                 decoration: const InputDecoration(
//                   contentPadding: EdgeInsets.only(left: 15.0),
//                   border: OutlineInputBorder(),
//                   focusedBorder: OutlineInputBorder(),
//                   hintText: "집결지 설명 (ex. CU앞, OO건물)",
//                   counterText: "",
//                 ),
//               ),
//             ),
//             ElevatedButton(
//               child: Text("이 위치로 설정"),
//               style: ElevatedButton.styleFrom(
//                 textStyle: TextStyle(fontSize: 17),
//                 elevation: 0,
//                 fixedSize: Size(Get.width * 0.9, Get.height * 0.05),
//                 primary: Colors.orange,
//               ),
//               onPressed: () {
//                 if (controller.descriptionOfReceivingLocation.text.isNotEmpty) {
//                   Get.back();
//                 } else {
//                   Get.snackbar(
//                     "위치 설정 실패",
//                     "집결지 설명을 작성해주세요!",
//                     backgroundColor: Colors.black,
//                     colorText: Colors.white,
//                     duration: Duration(milliseconds: 1000),
//                   );
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buttonChangeAddressType() {
//     return Container(
//       margin: EdgeInsets.only(top: 5),
//       width: 120,
//       decoration: BoxDecoration(
//         color: Colors.black12,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: GestureDetector(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.swap_horiz_rounded),
//             Text(
//               "지번으로 보기",
//               style: TextStyle(decoration: TextDecoration.lineThrough),
//             )
//           ],
//         ),
//         onTap: () {
//           print("지번으로 보기 <--> 도로명으로 보기");
//         },
//       ),
//     );
//   }
// }

class PickReceivingLocation extends GetView<PickReceivingLocationController> {
  const PickReceivingLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: appBar(),
          body: AnimatedCrossFade(
            crossFadeState: controller.isFirstPage()
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 300),
            firstChild: page1(),
            secondChild: page2(),
          ),
          floatingActionButton:
              controller.isFirstPage() ? SizedBox.shrink() : fab(),
        ),
      ),
    );
  }

  Widget page1() {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Column(
        children: [
          moveToMap(),
          controller.histories.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.histories.length,
                    itemBuilder: (BuildContext context, int index) =>
                        locationRecord(index),
                  ),
                )
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Image.asset(
                        "assets/images/icons/empty3.png",
                        width: 150,
                      ),
                    ),
                    Text("저장된 집결지 기록이 없습니다", style: infoTextStyle),
                  ],
                ),
        ],
      ),
    );
  }

  Widget page2() {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: controller.isPrepared.value
          ? Stack(
              children: [
                WebView(
                  initialUrl: controller.getHTML(),
                  onWebViewCreated: (ctrl) =>
                      controller.setWebViewController(ctrl),
                  javascriptMode: JavascriptMode.unrestricted,
                  javascriptChannels: controller.getChannels,
                  gestureRecognizers: <Factory<VerticalDragGestureRecognizer>>{}
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
                addressDescription(),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(color: Colors.grey),
            ),
    );
    // return ;
  }

  Widget moveToMap() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () async {
        await controller.refreshLocation();
        controller.moveSecondPage();
        controller.reloadWebView();
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
            Icon(Icons.keyboard_arrow_right_rounded),
          ],
        ),
      ),
    );
  }

  Widget locationRecord(int index) {
    ReceivingLocation record = controller.histories[index];

    return Container(
      color: Colors.white,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          print("이전 위치 텍스트 터치 체크");
          controller.changeToLocationHistory(record);
          controller.moveSecondPage();
          controller.reloadWebView();
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
                    child: Text(record.description),
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
      ),
    );
  }

  Widget addressDescription() {
    return SizedBox(
      height: Get.height * 0.10,
      width: Get.width,
      child: Center(
        child: Container(
          color: Colors.white,
          width: Get.width * 0.9,
          height: Get.height * 0.08,
          child: TextField(
            controller: controller.locationDescription,
            onChanged: (text) => controller.setIsDescriptionEmpty(text),
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
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      shape: const Border(
        bottom: BorderSide(color: Colors.black12, width: 1),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: controller.isFirstPage()
            ? const Icon(Icons.close_rounded, color: Colors.black)
            : const Icon(Icons.arrow_back_rounded, color: Colors.black),
        onPressed: () =>
            controller.isFirstPage() ? Get.back() : controller.moveFirstPage(),
      ),
      title: const Text("집결지 설정", style: appBarTitle),
      actions: [
        controller.isFirstPage()
            ? SizedBox.shrink()
            : TextButton(
                onPressed: controller.isDescriptionEmpty.value
                    ? null
                    : () {
                        controller.completePickLocation();
                        Get.back();
                      },
                child: Text("완료"),
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  textStyle: appBarAction,
                ),
              ),
      ],
    );
  }

  Widget fab() {
    return FloatingActionButton.small(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      child: const Icon(Icons.location_searching_rounded),
      onPressed: () => controller.reloadWebView(),
    );
  }
}
