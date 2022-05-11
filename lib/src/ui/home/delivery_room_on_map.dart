import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/home/home_controller.dart';
import 'package:share_delivery/src/data/model/delivery_room/delivery_room.dart';
import 'package:share_delivery/src/utils/time_util.dart';
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
                deliveryRoomInfoWindow(),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 200),
                  top: controller.showInfo.value ? 90 : 0,
                  child: FloatingActionButton.small(
                    heroTag: "refresh",
                    onPressed: () {
                      controller.hideInfo();
                      controller.reloadWebView();
                    },
                    child: const Icon(Icons.refresh),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                ),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(color: Colors.grey),
            ),
    );
  }

  Widget deliveryRoomInfoWindow() {
    HomeController controller = HomeController.to;

    return Obx(() {
      int index = controller.idxCurInfo.value;

      late final DeliveryRoom _info;
      if (index != -1) {
        _info = controller.deliveryRooms[index];
      } else {
        _info = dummyDeliveryRoom();
      }

      return AnimatedPositioned(
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 200),
        top: controller.showInfo.value ? 0 : -90,
        child: Container(
          width: Get.width,
          height: 90,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            border: const Border(
              top: BorderSide(color: Colors.black12, width: 1),
              bottom: BorderSide(color: Colors.black12, width: 1),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_info.content),
                  Row(
                    children: [
                      Text(TimeUtil.timeAgo(_info.createdDateTime.toLocal())),
                      Text("${_info.person} / ${_info.limitPerson}")
                    ],
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  print("참가");
                },
                child: Text("참가"),
              ),
            ],
          ),
        ),
      );
    });
  }

  DeliveryRoom dummyDeliveryRoom() {
    return DeliveryRoom(
      leader: Leader(
        nickname: '',
        mannerScore: -1,
      ),
      content: "content",
      person: -1,
      limitPerson: -1,
      storeLink: "",
      platformType: "",
      status: "",
      createdDateTime: DateTime.now(),
      receivingLocation: ReceivingLocation(
        description: '',
        longitude: -1,
        latitude: -1,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
