import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:share_delivery/src/controller/profile/friend/friend_controller.dart';
import 'package:share_delivery/src/data/provider/profile/profile_api_client.dart';
import 'package:share_delivery/src/data/repository/profile/profile_repository.dart';
import 'package:share_delivery/src/ui/profile/account_manage/account_manage.dart';
import 'package:share_delivery/src/ui/profile/app_setting/app_setting.dart';
import 'package:share_delivery/src/ui/profile/friend/friend.dart';
import 'package:share_delivery/src/ui/profile/modify_profile/modify_profile.dart';
import 'package:share_delivery/src/ui/theme/profile_theme.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          "프로필",
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
        actions: [
          IconButton(
            icon: Icon(Icons.settings, size: 30),
            onPressed: () => Get.toNamed('/appSetting'),
          )
        ],
      ),
      body: Container(
        color: Colors.grey.shade200,
        child: Column(
          children: [
            _buildProfile(),
            _buildMenuList(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfile() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      color: Colors.white,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 10.0,
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () => Get.toNamed(
                    '/exapndedImagePage',
                    arguments: {
                      "imagePath":
                          "https://cdn.pixabay.com/photo/2016/01/20/13/05/cat-1151519__480.jpg",
                      "title": "프로필 사진"
                    },
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      "https://cdn.pixabay.com/photo/2016/01/20/13/05/cat-1151519__480.jpg",
                    ),
                    backgroundColor: Colors.grey.shade300,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "닉네임닉네임", // TODO: 닉네임
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                side: BorderSide(
                  color: Colors.grey.shade300,
                ),
                elevation: 0.0,
                minimumSize: Size.fromHeight(45.0),
              ),
              onPressed: () => Get.to(ModifyProfile()),
              child: Text(
                "프로필 수정",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "매너온도",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 16.0,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: LinearPercentIndicator(
                    lineHeight: 18.0,
                    percent: 0.5, // TODO: 온도
                    center: Text(
                      "50°C",
                      style: TextStyle(fontSize: 12.0),
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(
                        Icons.mood,
                        size: 25,
                      ), // TODO: 온도에 따라 바꾸기
                    ),
                    backgroundColor: Colors.grey.shade300,
                    progressColor: Colors.orangeAccent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuListTile(String title, VoidCallback onTapCB) {
    return ListTile(
      onTap: onTapCB,
      tileColor: Colors.orangeAccent,
      selectedTileColor: Colors.brown,
      title: Text(
        title,
        style: profileTextStyle,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 20,
      ),
    );
  }

  Widget _buildMenuList() {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      color: Colors.white,
      child: Column(
        children: [
          ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              buildMenuListTile("계좌 관리", () => Get.to(AccountManage())),
              Divider(),
              buildMenuListTile("수령 위치 관리", () => print("hello1")),
              Divider(),
              buildMenuListTile("친구 관리", () => Get.to(FriendPage())),
              Divider(),
              buildMenuListTile("받은 평가", () => print("hello2")),
              Divider(),
              buildMenuListTile("생활 공유", () => print("hello3")),
            ],
          ),
        ],
      ),
    );
  }
}
