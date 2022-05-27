import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/widgets/pick_user_location_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PickUserLocation extends GetView<PickUserLocationController> {
  const PickUserLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // keyboard 클릭시 마커 삭제
    bool isKeyboardShowing = MediaQuery.of(context).viewInsets.vertical > 0;

    return Obx(
      () => SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: appBar(),
          body: controller.isPrepared.value
              ? Stack(
                  children: [
                    WebView(
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
                    addressDescription(),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(color: Colors.grey),
                ),
          floatingActionButton: fab(),
        ),
      ),
    );
  }

  Widget addressDescription() {
    return SizedBox(
      height: Get.height * 0.10,
      child: Center(
        child: Container(
          margin: EdgeInsets.all(15),
          child: TextField(
            controller: controller.locationDescription,
            maxLength: 13,
            decoration: const InputDecoration(
              fillColor: Colors.white,
              filled: true,
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
        icon: const Icon(Icons.close_rounded, color: Colors.black),
        onPressed: () => Get.back(),
      ),
      title: const Text("지도에서 위치 확인", style: TextStyle(color: Colors.black)),
      actions: [
        TextButton(
          onPressed: () {
            controller.saveLocationDataToLocal();
            controller.changePage(Get.arguments);
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Text("설정", style: TextStyle(color: Colors.black)),
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
