import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/home/home_controller.dart';
import 'package:share_delivery/src/data/model/delivery_room/delivery_room/delivery_room.dart';
import 'package:share_delivery/src/routes/route.dart';
import 'package:share_delivery/src/ui/theme/button_theme.dart';
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
        _info = emptyDeliveryRoom();
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
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _info.content,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          TimeUtil.timeAgo(_info.createdDateTime.toLocal()),
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Colors.black38,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.people_alt_rounded,
                                color: Colors.black38),
                            SizedBox(width: 5),
                            Text(
                              "${_info.person} / ${_info.limitPerson}",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                                color: Colors.black38,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: ElevatedButton(
                  style: orangeFlexBtn,
                  onPressed: () {
                    controller.setCurSelectedIdx(index);
                    Get.toNamed(Routes.DELIVERY_ROOM_INFO);
                    // print("참가");
                    // Get.toNamed(Routes.PARTICIPATE_ROOM, arguments: _info);
                  },
                  child: Text("보기"),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  DeliveryRoom emptyDeliveryRoom() {
    return DeliveryRoom(
      roomId: -1,
      leader: Leader(
        nickname: '',
        mannerScore: -1,
        accountId: -1,
      ),
      content: "content",
      person: -1,
      limitPerson: -1,
      deliveryTip: -1,
      storeLink: "",
      platformType: "",
      status: "",
      createdDateTime: DateTime.now(),
      receivingLocation: ReceivingLocation(
        description: '',
        lng: -1,
        lat: -1,
      ),
      storeCategory: '',
    );
  }

  @override
  bool get wantKeepAlive => true;
}
