import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/delivery_history/delivery_history_controller.dart';
import 'package:share_delivery/src/data/model/delivery_history/delivery_history_model.dart';
import 'package:share_delivery/src/data/provider/delivery_history/delivery_history_api_client.dart';
import 'package:share_delivery/src/data/repository/delivery_history/delivery_history_repository.dart';

import 'package:share_delivery/src/routes/route.dart';

class DeliveryHistory extends GetView<DeliveryHistoryController> {
  const DeliveryHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: 바인딩 찾아보기
    Dio dio = Dio();
    final String? host = dotenv.env['SERVER_HOST'];
    Get.put<DeliveryHistoryController>(
      DeliveryHistoryController(
        deliveryHistoryRepository: DeliveryHistoryRepository(
          apiClient: DeliveryHistoryApiClient(dio, baseUrl: host!),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          "내 배달",
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        backgroundColor: Colors.transparent,
        bottom: PreferredSize(
          child: Container(
            color: Colors.grey.shade300,
            height: 1.0,
          ),
          preferredSize: Size.fromHeight(1.0),
        ),
        elevation: 0.0,
      ),
      body: controller.obx(
        (historyPostList) => Center(
          child: ListView.separated(
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Get.toNamed(
                  Routes.DELIVERY_HISTORY_DETAIL,
                  arguments: {'deliveryRoomId': "1"},
                );
              },
              child: DeliveryHistoryPost(
                deliveryHistoryModel: historyPostList![index],
              ),
            ),
            separatorBuilder: (_, index) => Divider(
              endIndent: 20,
              indent: 20,
              color: Colors.grey.shade300,
              height: 0.5,
              thickness: 1,
            ),
            itemCount: historyPostList!.length,
          ),
        ),
      ),
    );
  }
}

class DeliveryHistoryPost extends StatelessWidget {
  final DeliveryHistoryModel deliveryHistoryModel;

  const DeliveryHistoryPost({
    Key? key,
    required this.deliveryHistoryModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        "https://cdn-icons-png.flaticon.com/512/123/123282.png"),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  color: Colors.grey.shade300,
                ),
              ),
              Center(
                child: _buildDeliveryRoomStatus(
                  deliveryHistoryModel.status.toString(),
                  Colors.red, // TODO: status 별로 color 구분
                  // status == "인원 모집중" ? Colors.orangeAccent : Colors.black54,
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
                    deliveryHistoryModel.content,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    children: [
                      Text(deliveryHistoryModel.receivingLocationDesc),
                      SizedBox(
                        height: 10,
                        child:
                            VerticalDivider(thickness: 1, color: Colors.grey),
                      ),
                      Text("5분전"), //TODO: date 받아오기
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
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
                            "${deliveryHistoryModel.peopleNumber} / ${deliveryHistoryModel.limitPerson}")
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

  Widget _buildDeliveryRoomStatus(String status, Color color) {
    return Container(
      width: 120,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0),
        ),
      ),
      child: Text(status),
    );
  }
}
