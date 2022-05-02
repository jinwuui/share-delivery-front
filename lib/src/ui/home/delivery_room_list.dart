import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/home/home_controller.dart';
import 'package:share_delivery/src/data/model/delivery_room/delivery_room.dart';
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
      child: ListView.separated(
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Get.toNamed(Routes.DELIVERY_ROOM_INFO, arguments: index);
          },
          child: DeliveryHistoryDummyPost(index: index),
        ),
        separatorBuilder: (_, index) => Divider(
          endIndent: 20,
          indent: 20,
          color: Colors.grey.shade300,
          height: 0.5,
          thickness: 1,
        ),
        itemCount: 5,
      ),
    );

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

class DeliveryHistoryDummyPost extends GetView<HomeController> {
  final int index;
  const DeliveryHistoryDummyPost({Key? key, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeliveryRoom _deliveryRoom = controller.deliveryRooms.value[index];

    // print(controller.deliveryRooms.value[index]);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: 120.0,
                height: 120.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://cdn.pixabay.com/photo/2016/01/22/02/13/meat-1155132__340.jpg'),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  color: Colors.grey,
                ),
              ),
              Center(
                child: Container(
                  width: 120,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                    ),
                  ),
                  child: Text("인원 모집중"),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              // color: Colors.yellow,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${_deliveryRoom.content}",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    children: [
                      Text("수령장소"),
                      SizedBox(
                        height: 10,
                        child:
                            VerticalDivider(thickness: 1, color: Colors.grey),
                      ),
                      Text("5분전"),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Text("메뉴 이름"),
                  // Text("메뉴 가격"),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.people,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                            "${_deliveryRoom.limitPerson - 1} / ${_deliveryRoom.limitPerson} ")
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
