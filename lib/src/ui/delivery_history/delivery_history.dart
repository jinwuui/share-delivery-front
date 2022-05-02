import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:share_delivery/src/controller/delivery_history/delivery_history_controller.dart';
import 'package:share_delivery/src/data/repository/delivery_history/delivery_history_repository.dart';
import 'package:share_delivery/src/routes/route.dart';

class DeliveryHistory extends StatelessWidget {
  const DeliveryHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.put<DeliveryHistoryController>(DeliveryHistoryController(
      deliveryHistoryRepository: DeliveryHistoryRepository(),
    ));
    List<DeliveryHistoryPost> list = [
      DeliveryHistoryPost(
        content: '투존치킨 먹을사람',
        date: '5분전',
        person: '1',
        receivingLocation: '디지털관 앞',
        status: '인원 모집중',
        categoryImage: 'https://cdn-icons-png.flaticon.com/512/123/123282.png',
      ),
      DeliveryHistoryPost(
        content: '맘터 바로먹을분',
        date: '10분전',
        person: '2',
        receivingLocation: 'gs 앞',
        status: '인원 모집중',
        categoryImage: 'https://cdn-icons-png.flaticon.com/128/405/405996.png',
      ),
      DeliveryHistoryPost(
        content: '한솥 배달',
        date: '50분전',
        person: '4',
        receivingLocation: '오름 2동',
        status: '모집 마감',
        categoryImage: 'https://cdn-icons-png.flaticon.com/128/641/641871.png',
      ),
      DeliveryHistoryPost(
        content: '멕시카나',
        date: '50분전',
        person: '4',
        receivingLocation: '오름 3동',
        status: '모집 마감',
        categoryImage: 'https://cdn-icons-png.flaticon.com/512/123/123282.png',
      ),
      DeliveryHistoryPost(
        content: 'BHC',
        date: '50분전',
        person: '4',
        receivingLocation: '오름 3동',
        status: '모집 마감',
        categoryImage: 'https://cdn-icons-png.flaticon.com/512/123/123282.png',
      ),
    ];

    return Center(
      child: ListView.separated(
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Get.toNamed(Routes.DELIVERY_HISTORY_DETAIL);
          },
          child: list[index],
        ),
        separatorBuilder: (_, index) => Divider(
          endIndent: 20,
          indent: 20,
          color: Colors.grey.shade300,
          height: 0.5,
          thickness: 1,
        ),
        itemCount: list.length,
      ),
    );
  }
}

class DeliveryHistoryPost extends StatelessWidget {
  final String status;
  final String content;
  final String receivingLocation;
  final String date;
  final String person;
  final String categoryImage;

  const DeliveryHistoryPost({
    Key? key,
    required this.status,
    required this.content,
    required this.receivingLocation,
    required this.date,
    required this.person,
    required this.categoryImage,
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
                    image: NetworkImage(categoryImage),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  color: Colors.grey.shade300,
                ),
              ),
              Center(
                child: _buildDeliveryRoomStatus(
                  status,
                  status == "인원 모집중" ? Colors.orangeAccent : Colors.black54,
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
                    content,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    children: [
                      Text(receivingLocation),
                      SizedBox(
                        height: 10,
                        child:
                            VerticalDivider(thickness: 1, color: Colors.grey),
                      ),
                      Text(date),
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
                        Text("$person / 4")
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
