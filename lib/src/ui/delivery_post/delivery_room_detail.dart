import 'package:flutter/material.dart';

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
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, size: 35),
            onPressed: () {},
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
              tabs: _tabChildParameters(),
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
                child: TabBarView(children: [
                  Container(
                    child: Text("Articles Body"),
                  ),
                  OrderTabView(),
                  Container(
                    child: Text("User Body"),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _tabChildParameters() => [
        Tab(
          child: Container(
            alignment: Alignment.center,
            constraints: BoxConstraints.expand(),
            child: Text("상세 정보"),
          ),
        ),
        Tab(
          child: Container(
            alignment: Alignment.center,
            constraints: BoxConstraints.expand(),
            child: Text("주문 정보"),
          ),
        ),
        Tab(
          child: Container(
            alignment: Alignment.center,
            constraints: BoxConstraints.expand(),
            child: Text("채팅방"),
          ),
        ),
      ];
}
