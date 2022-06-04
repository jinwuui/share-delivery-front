import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_order_controller.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_order_tab_controller.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_recruit_controller.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_room_info_detail_controller.dart';
import 'package:share_delivery/src/controller/login/authentication_controller.dart';
import 'package:share_delivery/src/data/model/user/user/user.dart';
import 'package:share_delivery/src/ui/chat/delivery_room_chat.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/page/delivery_room_info_detail.dart';
import 'package:share_delivery/src/ui/widgets/bottom_sheet_item.dart';

import 'delivery_order_detail/delivery_order_tabview.dart';

class DeliveryRoomDetail extends StatelessWidget {
  const DeliveryRoomDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
          IconButton(
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
                    Obx(() {
                      if ((AuthenticationController.to.state.props.first
                                  as User)
                              .accountId ==
                          DeliveryRoomInfoDetailController
                              .to.deliveryRoom.leader.accountId) {
                        return BottomSheetItem(
                          icon: Icon(Icons.delete),
                          text: "모집글 삭제 하기",
                          callback: () async {
                            await DeliveryRecruitController.to
                                .deleteDeliveryRoom(
                                    DeliveryRoomInfoDetailController
                                        .to.deliveryRoom.roomId);
                          },
                        );
                      } else {
                        return BottomSheetItem(
                          icon: Icon(Icons.exit_to_app),
                          text: "퇴장 하기",
                          callback: () async {
                            // TODO: test
                            await DeliveryRecruitController.to.exitDeliveryRoom(
                                DeliveryRoomInfoDetailController
                                    .to.deliveryRoom.roomId);
                          },
                        );
                      }
                    })
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
                    OrderTabView(),
                    Obx(
                      () => DeliveryOrderController.to.status ==
                                  DeliveryOrderStatus.recuritmentCompleted ||
                              DeliveryOrderController.to.status ==
                                  DeliveryOrderStatus.orderCompleted
                          ? DeliveryRoomChat()
                          : Center(
                              child: Text("인원 모집이 끝난 후 채팅을 이용해주세요."),
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
}
