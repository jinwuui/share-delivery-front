import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/home/home_controller.dart';
import 'package:share_delivery/src/routes/route.dart';

class DeliveryRoomList extends StatefulWidget {
  const DeliveryRoomList({Key? key}) : super(key: key);

  @override
  State<DeliveryRoomList> createState() => _DeliveryRoomListState();
}

class _DeliveryRoomListState extends State<DeliveryRoomList>
    with AutomaticKeepAliveClientMixin<DeliveryRoomList> {
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
            20,
            (index) => GestureDetector(
              onTap: () {
                Get.toNamed(Routes.DELIVERY_ROOM_INFO);
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

  @override
  bool get wantKeepAlive => true;
}
