import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/community/post_detail_controller.dart';
import 'package:share_delivery/src/ui/theme/container_theme.dart';
import 'package:share_delivery/src/ui/theme/text_theme.dart';

class PostDetail extends GetView<PostDetailController> {
  const PostDetail({Key? key}) : super(key: key);

  static const double normal = 10;
  static const double big = 20;

  @override
  Widget build(BuildContext context) {
    print(" controller.comments.isEmpty ${controller.comments.isEmpty}");
    return SafeArea(
      child: Scaffold(
        appBar: appBar(),
        body: Container(
          color: Colors.white,
          height: Get.height,
          width: Get.width,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    profile(),
                    content(),
                    controller.comments.isEmpty ? noComments() : comments(),
                    const SizedBox(width: 30, height: 68),
                  ],
                ),
              ),
              commentTextField(),
            ],
          ),
        ),
      ),
    );
  }

  Widget profile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        postTopic("동네질문"),
        Container(
          decoration: bottomBorderBox,
          margin: const EdgeInsets.only(left: big, right: big),
          padding: const EdgeInsets.only(bottom: big),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {},
                padding: const EdgeInsets.fromLTRB(0, 0, 15, 15),
                constraints: BoxConstraints(),
                // padding: EdgeInsets.zero,
                alignment: Alignment.topLeft,
                icon: Icon(
                  Icons.account_circle_outlined,
                  color: Colors.grey[600],
                  size: 40,
                ),
              ),
              const SizedBox(width: normal),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("예감학살자", style: postTitleStyle),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text("매너온도 36.5", style: postDetailStyle),
                        const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.fiber_manual_record,
                            size: 3,
                            color: Colors.grey,
                          ),
                        ),
                        Text("7분 전", style: postDetailStyle),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget content() {
    return Container(
      padding: const EdgeInsets.all(big),
      decoration: bottomBorderBox,
      child: Text(
        "안녕하세요 저는 박찬호 입니다. 호투를 하며 제 전성기 시절을 떠올리게하는 LA 다저스 시절이 가장 먼저 생각나기도 하고, 경기가 끝나면 나긋하게 ",
        style: detailContentStyle,
      ),
      // child: ,
    );
  }

  Widget noComments() {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Column(
        children: const [
          Icon(Icons.sms, size: 80, color: Colors.black12),
          SizedBox(height: 10),
          Text(
            "댓글이 없습니다.",
            style: TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.w800,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "처음으로 의견을 공유해주세요!",
            style: TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget comments() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: controller.comments.length,
      itemBuilder: (_, idx) => controller.isParentComment(idx)
          ? parentComment(idx)
          : childComment(idx),
    );
  }

  Widget parentComment(int idx) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        bottom: controller.isLastComment(idx) ? 30 : 0,
        left: big - 4,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 5, 5),
              child: Icon(Icons.account_circle_outlined, size: 40),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text("닉네임", style: postTitleStyle),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Row(
                    children: [
                      Text("매너온도 36.5", style: postDetailStyle),
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.fiber_manual_record,
                          size: 3,
                          color: Colors.grey,
                        ),
                      ),
                      Text("7분 전", style: postDetailStyle),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: Text(
                    "상인엔 있는데 진천에서는 본적 없는것 같아영asdfasdfasdfasasdfasd",
                    style: commentStyle,
                  ),
                ),
                Text("답글쓰기"),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            padding: EdgeInsets.fromLTRB(10, 0, big, 10),
            constraints: BoxConstraints(),
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
    );
  }

  Widget childComment(int idx) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        bottom: controller.isLastComment(idx) ? 30 : 0,
        left: big * 2 + normal * 2 - 1,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 0, 5, 5),
              // color: Colors.blue,
              child: Icon(
                Icons.account_circle_outlined,
                size: 33,
              ),
            ),
          ),
          // Container(
          //   color: Colors.red,
          //   padding: EdgeInsets.fromLTRB(big, 0, normal, normal),
          //   child: IconButton(
          //     onPressed: () {
          //       print("adf");
          //     },
          //     alignment: Alignment.center,
          //     padding: EdgeInsets.zero,
          //     constraints: BoxConstraints(),
          //     icon: Icon(Icons.account_circle_outlined,
          //         size: controller.isChildComment(idx) ? 25 : 30),
          //   ),
          // ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text("닉네임", style: postTitleStyle),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Row(
                    children: [
                      Text("매너온도 36.5", style: postDetailStyle),
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.fiber_manual_record,
                          size: 3,
                          color: Colors.grey,
                        ),
                      ),
                      Text("7분 전", style: postDetailStyle),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: Text(
                    "상인엔 있는데 진천에서는 본적 없는것 같아영asdfasdfasdfasasdfasd",
                    style: commentStyle,
                  ),
                ),
                Text("답글쓰기"),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            padding: EdgeInsets.fromLTRB(10, 0, big, 10),
            constraints: BoxConstraints(),
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
    );
    // return Container(
    //   color: idx % 2 == 1 ? Colors.red : Colors.blue,
    //   height: ,
    //   // width: double.infinity,
    // );
  }

  Widget postTopic(String category) {
    return Container(
      // alignment: Alignment.centerLeft,

      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(4),
      ),
      margin: const EdgeInsets.all(big),
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Text(
        category,
        style:
            TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.w600),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      shape: const Border(bottom: BorderSide(color: Colors.black12, width: 1)),
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(Icons.arrow_back_rounded, color: Colors.black),
      ),
      actions: [
        IconButton(
          onPressed: () {
            print("click notifications_rounded");
          },
          icon: Icon(Icons.notifications_rounded, color: Colors.black),
        ),
        IconButton(
          onPressed: () {
            print("click ios_share");
          },
          icon: Icon(Icons.ios_share, color: Colors.black),
        ),
        IconButton(
          onPressed: () {
            print("click more_vert");
          },
          icon: Icon(Icons.more_vert, color: Colors.black),
        ),
      ],
    );
  }

  Widget commentTextField() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: topBorderBox,
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              padding: const EdgeInsets.fromLTRB(14, 0, 7, 0),
              // padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              icon: Icon(
                Icons.location_on_outlined,
                size: 30,
                color: Colors.grey[600],
              ),
            ),
            IconButton(
              onPressed: () {},
              // padding: EdgeInsets.zero,
              padding: const EdgeInsets.fromLTRB(7, 0, 14, 0),
              constraints: BoxConstraints(),
              icon: Icon(
                Icons.image_outlined,
                size: 30,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(
              width: Get.width - 90,
              child: Card(
                elevation: 0,
                color: Colors.grey[100],
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  minLines: 1,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "댓글을 입력해주세요.",
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    prefix: const SizedBox(width: 20),
                    suffix: const SizedBox(width: 20),
                    // prefixIcon: Row(
                    //   mainAxisSize: MainAxisSize.min,
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [],
                    // ),
                    // suffixIcon: Row(
                    //   mainAxisSize: MainAxisSize.min,
                    //   children: [
                    //     IconButton(
                    //       onPressed: () {},
                    //       icon: Icon(Icons.attach_file),
                    //     ),
                    //     IconButton(
                    //       onPressed: () {},
                    //       icon: Icon(Icons.camera_alt),
                    //     ),
                    //   ],
                    // ),
                    // contentPadding: EdgeInsets.only(left: 5),
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(
            //     bottom: 8.0,
            //     right: 5.0,
            //     left: 2,
            //   ),
            //   child: CircleAvatar(
            //     radius: 25,
            //     backgroundColor: Colors.orangeAccent,
            //     child: IconButton(
            //       icon: Icon(
            //         Icons.mic,
            //         color: Colors.white,
            //       ),
            //       onPressed: () {},
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
