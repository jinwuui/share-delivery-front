import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:share_delivery/src/controller/profile/friend/friend_controller.dart';
import 'package:share_delivery/src/controller/profile/other_user/other_user_profile_controller.dart';
import 'package:share_delivery/src/controller/profile/profile_controller.dart';
import 'package:share_delivery/src/routes/route.dart';
import 'package:share_delivery/src/ui/profile/modify_profile/modify_profile.dart';
import 'package:share_delivery/src/ui/widgets/bottom_sheet_item.dart';
import 'package:share_delivery/src/utils/image_util.dart';

class OtherUserProfile extends GetView<OtherUserProfileController> {
  const OtherUserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isLoad.value == true
        ? Scaffold(
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
                          // BottomSheetItem(
                          //   icon: Icon(Icons.report),
                          //   text: "신고하기",
                          //   callback: () {}, // TODO:
                          // ),
                          BottomSheetItem(
                            icon: Icon(Icons.block),
                            text: "친구 삭제",
                            callback: () {
                              ProfileController.to.deleteFriend(
                                  controller.user.value.accountId);
                            }, // TODO:
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
                ],
              ),
            ),
          )
        : Center(child: CircularProgressIndicator()));
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
                      "imagePath": imagePathWithHost(
                          controller.user.value.profileImageUrl),
                      "title": "프로필 사진"
                    },
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: customNetworkImage(
                        controller.user.value.profileImageUrl),
                    backgroundColor: Colors.grey.shade300,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      controller.user.value.nickname,
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
                  onPressed: () => ProfileController.to
                      .addFriend(controller.user.value.accountId),
                  child: Text(
                    "친구 추가",
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
                    percent: controller.user.value.mannerScore / 100,
                    center: Text(
                      "${controller.user.value.mannerScore}°C",
                      style: TextStyle(fontSize: 12.0),
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(
                        Icons.mood,
                        size: 25,
                      ),
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
}
