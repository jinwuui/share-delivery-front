import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/profile/friend/friend_controller.dart';
import 'package:share_delivery/src/controller/profile/profile_controller.dart';
import 'package:share_delivery/src/data/repository/profile/friend_res_dto.dart';
import 'package:share_delivery/src/routes/route.dart';
import 'package:share_delivery/src/ui/widgets/bottom_sheet_item.dart';
import 'package:share_delivery/src/utils/image_util.dart';

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
                    FriendItem(friendModel: friends[index]),
              ),
              onLoading: Center(
                  child: SpinKitThreeBounce(
                size: 25,
                color: Colors.black,
              )),
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
  final FriendResDTO friendModel;

  const FriendItem({Key? key, required this.friendModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () {
          Get.toNamed(Routes.OTHER_USER_PROFILE,
              arguments: {"accountId": friendModel.accountId});
        },
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
            backgroundImage:
                NetworkImage(imagePathWithHost(friendModel.profileImageUrl)),
            backgroundColor: Colors.white,
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(bottom: 5.0),
          child: Text(
            friendModel.nickname,
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
                  BottomSheetItem(
                    icon: Icon(Icons.block),
                    text: "삭제하기",
                    callback: () async {
                      await ProfileController.to
                          .deleteFriend(friendModel.accountId);
                    },
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
}
