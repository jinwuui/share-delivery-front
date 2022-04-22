import 'package:flutter/material.dart';

class DeliveryHistoryDetail extends StatelessWidget {
  const DeliveryHistoryDetail({Key? key}) : super(key: key);

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
                  Container(
                    child: Text("Articles Body"),
                  ),
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

// class DeliveryPostDetail extends StatelessWidget {
//   const DeliveryPostDetail({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Container(
//             width: double.infinity,
//             height: 400,
//             padding: EdgeInsets.all(20),
//             margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//             decoration: BoxDecoration(
//               color: Colors.white60,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Text(
//                       "인원 모집 중",
//                     ),
//                     SizedBox(
//                       height: 10,
//                       child: VerticalDivider(
//                         thickness: 2,
//                         color: Colors.black,
//                       ),
//                     ),
//                     Text("5분전")
//                   ],
//                 ),
//                 Text("투존 치킨에서 시키실 뿐 "),
//                 Text("배달이 완료되었어요"),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
