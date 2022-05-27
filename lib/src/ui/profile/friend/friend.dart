import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/profile/friend/friend_controller.dart';
import 'package:share_delivery/src/data/model/user/user/user.dart';
import 'package:share_delivery/src/data/provider/profile/profile_api_client.dart';
import 'package:share_delivery/src/data/repository/profile/profile_repository.dart';

class FriendPage extends GetView<FriendController> {
  const FriendPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dio dio = Dio();
    dio.options.contentType = "application/json";
    final String? host = dotenv.env['SERVER_HOST'];

    // 프로필 - 친구 관리 컨트롤러 get 세팅
    Get.put(
      FriendController(
        repository: ProfileRepository(
          apiClient: ProfileApiClient(dio, baseUrl: host!),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          "친구 관리",
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
        (friends) => ListView.builder(
          itemCount: friends!.length,
          itemBuilder: (context, index) {
            return FriendItem(userModel: friends[index]);
          },
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
      ),
    );
  }
}

class FriendItem extends StatelessWidget {
  final User userModel;

  const FriendItem({Key? key, required this.userModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage:
            NetworkImage('https://www.woolha.com/media/2020/03/eevee.png'),
        minRadius: 50,
        maxRadius: 75,
      ),
      title: Text('Title-Text'),
      subtitle: Text('Subtitle-Text'),
      trailing: Icon(Icons.more_vert),
    );
  }
}
