import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_order_controller.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_order_tab_controller.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_recruit_controller.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_room_info_detail_controller.dart';
import 'package:share_delivery/src/controller/login/authentication_controller.dart';
import 'package:share_delivery/src/data/model/user/user/user.dart';
import 'package:share_delivery/src/services/delivery_room_manage_service.dart';
import 'package:share_delivery/src/services/setting_service.dart';
import 'package:share_delivery/src/ui/delivery_post/chat/delivery_room_chat.dart';
import 'package:share_delivery/src/ui/delivery_post/detail/delivery_room_info_detail.dart';
import 'package:share_delivery/src/ui/delivery_post/order/delivery_order.dart';
import 'package:share_delivery/src/ui/widgets/bottom_sheet_item.dart';

class DeliveryRoomDetail extends StatelessWidget {
  const DeliveryRoomDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          "모집글",
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          _buildDeliveryRoomStatus(),
          Obx(() => DeliveryOrderController.to.status == DeliveryRoomState.OPEN
              ? IconButton(
                  icon: Icon(Icons.more_vert, size: 30),
                  onPressed: () {
                    Get.bottomSheet(
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Divider(
                              indent: 170,
                              endIndent: 170,
                              thickness: 5,
                              height: 20,
                              color: Colors.black54),
                          (AuthenticationController.to.state.props.first
                                          as User)
                                      .accountId ==
                                  DeliveryRoomInfoDetailController
                                      .to.deliveryRoom.leader.accountId
                              ? BottomSheetItem(
                                  icon: Icon(Icons.delete),
                                  text: "모집글 삭제하기",
                                  callback: () async {
                                    await DeliveryRecruitController.to
                                        .deleteDeliveryRoom(
                                            DeliveryRoomInfoDetailController
                                                .to.deliveryRoom.roomId);
                                  },
                                )
                              : BottomSheetItem(
                                  icon: Icon(Icons.exit_to_app),
                                  text: "퇴장하기",
                                  callback: () async {
                                    await DeliveryRecruitController.to
                                        .exitDeliveryRoom(
                                            DeliveryRoomInfoDetailController
                                                .to.deliveryRoom.roomId);
                                  },
                                )
                        ],
                      ),
                      backgroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0)),
                      ),
                    );
                  },
                )
              : Container()),
        ],
        elevation: 0.0,
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
              tabs: DeliveryOrderTabController.to.tabChildParameters,
              onTap: DeliveryOrderTabController
                  .to.switchTab, // receives tab # on tab click
              controller: DeliveryOrderTabController.to.controller,
              labelColor: Colors.black,
              // labelPadding: EdgeInsets.symmetric(vertical: 10),
              labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              unselectedLabelColor: Colors.grey,
              unselectedLabelStyle:
                  TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(color: Colors.black, width: 2),
                insets: EdgeInsets.symmetric(horizontal: 30),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.grey.shade200,
                child: TabBarView(
                  controller: DeliveryOrderTabController.to.controller,
                  children: [
                    DeliveryRoomInfoDetail(),
                    Obx(() =>
                        DeliveryRoomInfoDetailController.to.isLoad.value == true
                            ? DeliveryOrder()
                            : Container()),
                    Obx(
                      () => DeliveryOrderController.to.status !=
                              DeliveryRoomState.OPEN
                          ? DeliveryRoomChat()
                          : Center(
                              child: Text("인원 모집이 끝난 후 채팅방 이용이 가능합니다."),
                            ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDeliveryRoomStatus() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            getDeliveryRoomStateWithColor(describeEnum(
                    DeliveryOrderController.to.deliveryOrderStatus.value))
                .name,
            style: TextStyle(
              fontSize: 20,
              color: Colors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
