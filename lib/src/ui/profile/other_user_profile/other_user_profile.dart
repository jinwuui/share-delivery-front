import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:share_delivery/src/controller/profile/other_user/other_user_profile_controller.dart';
import 'package:share_delivery/src/routes/route.dart';
import 'package:share_delivery/src/ui/profile/modify_profile/modify_profile.dart';
import 'package:share_delivery/src/ui/widgets/bottom_sheet_item.dart';

class OtherUserProfile extends GetView<OtherUserProfileController> {
  const OtherUserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            icon: Icon(Icons.more_vert, size: 30),
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
                      icon: Icon(Icons.report),
                      text: "신고하기",
                      callback: () {}, // TODO:
                    ),
                    BottomSheetItem(
                      icon: Icon(Icons.block),
                      text: "차단하기",
                      callback: () {}, // TODO:
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
          )
        ],
      ),
      body: Container(
        color: Colors.grey.shade200,
        child: Column(
          children: [
            _buildProfile(),
            // _buildMenuList(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfile() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      color: Colors.white,
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
                    Routes.EXPANDED_IMAGE_PAGE,
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
          Row(
            children: [
              Expanded(
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
                    "평가하기",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
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
                    "평가하기",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ],
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

  // Widget buildMenuListTile(String title, VoidCallback onTapCB) {
  //   return ListTile(
  //     onTap: onTapCB,
  //     tileColor: Colors.orangeAccent,
  //     selectedTileColor: Colors.brown,
  //     title: Text(
  //       title,
  //       style: profileTextStyle,
  //     ),
  //     trailing: Icon(
  //       Icons.arrow_forward_ios,
  //       size: 20,
  //     ),
  //   );
  // }

  // Widget _buildMenuList() {
  //   return Container(
  //     margin: EdgeInsets.only(top: 20.0),
  //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
  //     color: Colors.white,
  //     child: Column(
  //       children: [
  //         ListView(
  //           physics: NeverScrollableScrollPhysics(),
  //           shrinkWrap: true,
  //           children: [
  //             buildMenuListTile(
  //                 "계좌 관리", () => Get.toNamed(Routes.ACCOUNT_MANAGE)),
  //             Divider(),
  //             buildMenuListTile("수령 위치 관리", () => print("hello1")),
  //             Divider(),
  //             buildMenuListTile("친구 관리", () => Get.toNamed(Routes.FRIEND)),
  //             Divider(),
  //             buildMenuListTile("받은 평가", () => print("hello2")),
  //             Divider(),
  //             buildMenuListTile("생활 공유", () => print("hello3")),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
}
