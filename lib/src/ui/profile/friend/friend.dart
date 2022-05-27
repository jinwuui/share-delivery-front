import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/profile/friend/friend_controller.dart';
import 'package:share_delivery/src/data/model/user/user/user.dart';

class FriendPage extends GetView<FriendController> {
  const FriendPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.all(15),
              child: TextField(
                onChanged: (value) => controller.filterFriends(value),
                controller: controller.searchController,
                maxLength: 15,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.only(left: 15.0),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  hintText: "검색",
                  counterText: "",
                ),
              ),
            ),
          ),
          Expanded(
            child: controller.obx(
              (friends) => ListView.builder(
                itemCount: friends!.length,
                itemBuilder: (context, index) =>
                    FriendItem(userModel: friends[index]),
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
          ),
        ],
      ),
    );
  }
}

class FriendItem extends StatelessWidget {
  final User userModel;

  const FriendItem({Key? key, required this.userModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 3.0,
              color: Colors.grey.shade200,
            ),
          ),
          child: CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2016/01/20/13/05/cat-1151519__480.jpg'),
            backgroundColor: Colors.white,
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(bottom: 5.0),
          child: Text(
            userModel.nickname,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ),
        trailing: IconButton(
          onPressed: () {
            Get.bottomSheet(
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Divider(
                      indent: 170,
                      endIndent: 170,
                      thickness: 5,
                      height: 20,
                      color: Colors.black54),
                  bottomSheetItem(
                    icon: Icon(Icons.block),
                    text: "차단하기",
                    callback: () {},
                  ),
                ],
              ),
              backgroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0)),
              ),
            );
          },
          icon: Icon(Icons.more_vert),
        ),
      ),
    );
  }

  Widget bottomSheetItem({
    required Icon icon,
    required String text,
    required callback,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () => callback(),
        leading: icon,
        title: Text(
          text,
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
