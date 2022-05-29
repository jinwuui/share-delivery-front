import 'package:flutter/material.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_order_tab_controller.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/page/delivery_room_info_detail.dart';

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
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.refresh, size: 35),
        //     onPressed: () {},
        //   )
        // ],
        backgroundColor: Colors.transparent,
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
                      Container(
                        child: Center(
                          child: Text("채팅 방"),
                        ),
                      ),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
