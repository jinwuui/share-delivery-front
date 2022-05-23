import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_room_info_detail_controller.dart';
import 'package:share_delivery/src/data/model/delivery_room/delivery_room.dart';

class DeliveryRoomInfoDetail extends GetView<DeliveryRoomInfoDetailController> {
  const DeliveryRoomInfoDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (_deliveryRoom) => Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.grey.shade100,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: Get.height * 0.2,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.topLeft,
                  child: Text(
                    _deliveryRoom!.content,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Divider(height: 15),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "방장",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            _deliveryRoom.leader.nickname,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "매너 온도",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            _deliveryRoom.leader.mannerScore.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(height: 15),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "참여 인원",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            (_deliveryRoom.limitPerson - 1).toString() +
                                " / " +
                                _deliveryRoom.limitPerson.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(height: 15),
                Center(
                  child: Column(
                    children: [
                      ElevatedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "음식점 보러가기",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Icon(Icons.east),
                            Text(
                              _deliveryRoom.linkPlatformType == "BAEMIN"
                                  ? "배민"
                                  : "요기요",
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: _deliveryRoom.linkPlatformType == "BAEMIN"
                              ? Color.fromRGBO(42, 193, 188, 1)
                              : Color.fromRGBO(249, 0, 80, 1), // NOTE: 요기요 색깔
                          textStyle: const TextStyle(fontSize: 17),
                          elevation: 0,
                          fixedSize: Size(Get.width * 0.7, Get.height * 0.05),
                        ),
                        onPressed: () {
                          // TODO : 모집글 참여 로직 필요
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      onLoading: Center(child: CircularProgressIndicator()),
      onError: (error) {
        return Center(
          child: Text(
            'Error: $error',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
