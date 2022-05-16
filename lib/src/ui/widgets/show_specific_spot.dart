import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/widgets/show_specific_spot_controller.dart';
import 'package:share_delivery/src/data/model/delivery_room/delivery_room/delivery_room.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ShowSpecificSpot extends GetView<ShowSpecificSpotController> {
  final ReceivingLocation spot;

  const ShowSpecificSpot({Key? key, required this.spot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ShowSpecificSpotController(spot: spot));

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      height: Get.height * 0.6,
      child: Column(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => Get.back(),
            child: SizedBox(
              width: double.infinity,
              child: Icon(Icons.horizontal_rule, size: 30),
            ),
          ),
          Expanded(
            child: specificSpotMap(),
          ),
        ],
      ),
    );
  }

  Widget specificSpotMap() {
    return WebView(
      initialUrl: controller.getHTML(),
      onWebViewCreated: (ctrl) => controller.setWebViewController(ctrl),
      javascriptMode: JavascriptMode.unrestricted,
      javascriptChannels: controller.getChannels,
      gestureRecognizers: Set()
        ..add(Factory<VerticalDragGestureRecognizer>(
            () => VerticalDragGestureRecognizer())),
    );
  }
}
