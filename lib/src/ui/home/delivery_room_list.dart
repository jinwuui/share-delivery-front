import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:share_delivery/src/controller/home/home_controller.dart';
import 'package:share_delivery/src/data/model/delivery_room/delivery_room/delivery_room.dart';
import 'package:share_delivery/src/routes/route.dart';
import 'package:share_delivery/src/services/setting_service.dart';
import 'package:share_delivery/src/utils/time_util.dart';

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
    return Obx(
      () => Center(
        child: SmartRefresher(
          controller: controller.refresher,
          enablePullDown: true,
          // enablePullUp: true,
          onRefresh: controller.onRefresh,
          onLoading: controller.onLoading,
          child: controller.deliveryRooms.isNotEmpty
              ? deliveryRoomList()
              : noDeliveryRooms(),
        ),
      ),
    );
  }

  Widget deliveryRoomList() {
    return ListView.separated(
      itemCount: controller.deliveryRooms.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          controller.setCurSelectedIdx(index);
          Get.toNamed(Routes.DELIVERY_ROOM_INFO);
        },
        child: DeliveryRoomPost(deliveryRoom: controller.deliveryRooms[index]),
      ),
      separatorBuilder: (_, __) => const Divider(
        endIndent: 20,
        indent: 20,
        color: Color.fromRGBO(224, 224, 224, 1),
        height: 0.5,
        thickness: 1,
      ),
    );
  }

  Widget noDeliveryRooms() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(50.0),
          child: Image.asset(
            "assets/images/icons/empty3.png",
            width: 150,
            color: Colors.black38,
          ),
        ),
        Column(
          children: [
            Text(
              "조회된 모집글이 없습니다",
              style: TextStyle(
                color: Colors.black38,
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_downward_rounded,
                  color: Colors.black38,
                ),
                SizedBox(width: 10),
                Text(
                  "당겨서 새로고침",
                  style: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Column(
        children: const [
          Icon(Icons.sms, size: 80, color: Colors.black12),
          SizedBox(height: 10),
          Text(
            "게시글이 없습니다.",
            style: TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.w800,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "처음으로 의견을 공유해주세요!",
            style: TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class DeliveryRoomPost extends GetView<HomeController> {
  final DeliveryRoom deliveryRoom;
  final double padding = 10;
  final double baseLen = 120.0;

  const DeliveryRoomPost({
    Key? key,
    required this.deliveryRoom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int distanceNum =
        controller.distanceBetween(deliveryRoom.receivingLocation);
    String distanceStr =
        distanceNum == -1 ? "위치설정 필요" : distanceNum.toString() + " m";

    return Container(
      margin: EdgeInsets.symmetric(horizontal: padding, vertical: padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        // color: Colors.blue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: baseLen,
                height: baseLen,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(Hive.box('foodCategory')
                        .get(deliveryRoom.storeCategory.toString())),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  color: Colors.white,
                ),
              ),
              Center(
                child: Container(
                  width: baseLen,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: getDeliveryRoomStateWithColor(
                            deliveryRoom.status.toString())
                        .color,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                    ),
                  ),
                  child: Text(getDeliveryRoomStateWithColor(
                          deliveryRoom.status.toString())
                      .name),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              height: baseLen,
              padding: EdgeInsets.only(left: padding, right: padding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        deliveryRoom.content,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        deliveryRoom.storeName,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.grey.shade700,
                          fontSize: 17,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            deliveryRoom.receivingLocation.description,
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.fiber_manual_record,
                              size: 6.5,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            distanceStr,
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        TimeUtil.timeAgo(
                          deliveryRoom.createdDateTime.toLocal(),
                        ),
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.people),
                          SizedBox(width: 4),
                          Text(
                            "${deliveryRoom.person} / ${deliveryRoom.limitPerson}",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ],
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
