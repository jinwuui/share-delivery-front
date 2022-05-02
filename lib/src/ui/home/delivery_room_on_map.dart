import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/home/home_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DeliveryRoomOnMap extends StatefulWidget {
  const DeliveryRoomOnMap({Key? key}) : super(key: key);

  @override
  State<DeliveryRoomOnMap> createState() => _DeliveryRoomOnMapState();
}

class _DeliveryRoomOnMapState extends State<DeliveryRoomOnMap>
    with AutomaticKeepAliveClientMixin<DeliveryRoomOnMap> {
  @override
  Widget build(BuildContext context) {
    HomeController controller = HomeController.to;

    return Obx(
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
    );
  }

  @override
  bool get wantKeepAlive => true;
}
