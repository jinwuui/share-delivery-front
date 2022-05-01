import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/home/home_controller.dart';
import 'package:share_delivery/src/ui/home/delivery_room_list.dart';
import 'package:share_delivery/src/ui/home/delivery_room_on_map.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return DefaultTabController(
      length: 2,
      child: Column(
        children: const [
          TabBar(
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.black,
            labelPadding: EdgeInsets.all(8),
            indicatorColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Icon(Icons.list),
              Icon(Icons.map_outlined),
            ],
          ),
          Expanded(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [DeliveryRoomList(), DeliveryRoomOnMap()],
            ),
          ),
        ],
      ),
    );
  }
}
