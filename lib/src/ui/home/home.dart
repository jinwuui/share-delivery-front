import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/home/home_controller.dart';
import 'package:share_delivery/src/data/provider/RestClient.dart';
import 'package:share_delivery/src/data/provider/home/home_api_client/home_api_client.dart';
import 'package:share_delivery/src/data/provider/home/home_local_client.dart';
import 'package:share_delivery/src/data/repository/home/home_repository.dart';
import 'package:share_delivery/src/routes/route.dart';
import 'package:share_delivery/src/ui/home/delivery_room_list.dart';
import 'package:share_delivery/src/ui/home/delivery_room_on_map.dart';
import 'package:share_delivery/src/utils/dio_util.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(
      HomeController(
        repository: HomeRepository(
          apiClient: HomeApiClient(DioUtil.getDio()),
          localClient: HomeLocalClient(),
        ),
      ),
    );

    return Scaffold(
      appBar: appBar(),
      body: DefaultTabController(
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
      ),
      floatingActionButton: fab(),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      shape: const Border(
        bottom: BorderSide(
          color: Colors.black26,
          width: 0.5,
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      titleSpacing: 0.0,
      title: Row(
        children: [
          TextButton(
            onPressed: () => Get.toNamed(Routes.PICK_USER_LOCATION),
            child: const Text(
              "위치 설정",
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
          Container(
            color: Colors.black,
            height: 20,
            width: 1,
          ),
          TextButton(
            onPressed: () => Get.toNamed(Routes.FAST_MATCHING),
            child: const Text(
              "빠른 매칭",
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget fab() {
    return FloatingActionButton(
      heroTag: "deliveryRoomRegisterFAB",
      backgroundColor: Colors.orange,
      onPressed: () => Get.toNamed(Routes.DELIVERY_ROOM_REGISTER),
      child: const Icon(Icons.add_rounded, size: 40),
    );
  }
}

class RetrofitScreen extends StatefulWidget {
  const RetrofitScreen({Key? key}) : super(key: key);

  @override
  _RetrofitScreenState createState() => _RetrofitScreenState();
}

class _RetrofitScreenState extends State<RetrofitScreen> {
  late RestClient client;

  @override
  void initState() {
    super.initState();

    Dio dio = Dio();
    client = RestClient(dio);

    Future.microtask(() async {
      final res = await client.getTopNews();

      print(res);
    });
  }

  renderNewsCard({
    required News news,
  }) {
    return Card(
      child: Column(
        children: [
          Text(news.id.toString()),
          Text(news.title),
          Text(news.url),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: client.getTopNews(),
        initialData: [],
        builder: (_, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final ids = snapshot.data;

          return ListView.builder(
              itemCount: ids!.length,
              itemBuilder: (_, index) {
                return FutureBuilder(
                  future: client.getNewsDetail(id: ids[index]),
                  builder: (_, AsyncSnapshot<News> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.data == null) return SizedBox.shrink();
                    return renderNewsCard(news: snapshot.data!);
                  },
                );
              });
        },
      ),
    );
  }
}
