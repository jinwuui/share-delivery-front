import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/home/home_controller.dart';
import 'package:share_delivery/src/routes/route.dart';
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
        children: [
          TabBar(
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.black,
            // isScrollable: false,
            labelPadding: const EdgeInsets.all(8),
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

  Widget deliveryRoomList() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
            20,
            (index) => GestureDetector(
              onTap: () {
                Get.toNamed(Routes.DELIVERY_ROOM_DETAIL);
              },
              child: Column(
                children: [
                  Container(
                    height: 120,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey.shade200,
                    ),
                  ),
                  Divider(
                    endIndent: 20,
                    indent: 20,
                    color: Colors.grey.shade400,
                    thickness: 1.5,
                    height: 0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget deliveryRoomOnMap() {
    return Container(
      color: Colors.red,
    );
  }
}
