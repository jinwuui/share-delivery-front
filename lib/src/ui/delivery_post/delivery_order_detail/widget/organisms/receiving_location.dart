import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/receving_location_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RecevingLocation extends GetView<ReceivingLocationController> {
  const RecevingLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ReceivingLocationController());

    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "수령 장소",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
              color: Colors.white70,
            ),
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Obx(
                () => controller.isPrepared.value
                    ? Stack(
                        alignment: Alignment.topRight,
                        children: [
                          WebView(
                            initialUrl: controller.getHTML(),
                            onWebViewCreated: (ctrl) =>
                                controller.setWebViewController(ctrl),
                            javascriptMode: JavascriptMode.unrestricted,
                            javascriptChannels: controller.getChannels,
                          ),
                          FloatingActionButton.small(
                            heroTag: "refresh",
                            onPressed: () => controller.reloadWebView(),
                            child: const Icon(Icons.refresh),
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                          ),
                        ],
                      )
                    : const Center(
                        child: CircularProgressIndicator(color: Colors.grey),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
