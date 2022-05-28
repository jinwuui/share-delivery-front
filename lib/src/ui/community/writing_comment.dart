import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/community/post_detail_controller.dart';
import 'package:share_delivery/src/ui/community/post_detail/post_detail.dart';
import 'package:share_delivery/src/ui/theme/container_theme.dart';
import 'package:share_delivery/src/ui/theme/text_theme.dart';

class WritingComment extends GetView<PostDetailController> {
  const WritingComment({Key? key}) : super(key: key);

  static const double normal = PostDetail.normal;
  static const double big = PostDetail.big;
  static const double parentAvatar = PostDetail.parentAvatar;
  static const double childAvatar = PostDetail.childAvatar;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(),
        body: GestureDetector(
          onTap: () {
            if (MediaQuery.of(context).viewInsets.bottom != 0) {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          },
          child: Container(
            color: Colors.white,
            height: Get.height,
            width: Get.width,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      comments(),
                      const SizedBox(width: 30, height: 68),
                    ],
                  ),
                ),
                commentTextField(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget comments() {
    int parentId = Get.arguments;
    List<Comment> group = controller.getCommentGroup(parentId);
    print('WritingComment.comments $parentId $group');

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: group.length,
      itemBuilder: (_, idx) => group[idx].id == group[idx].parentId
          ? parentComment(group[idx])
          : childComment(group[idx]),
    );
  }

  Widget parentComment(Comment comment) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        left: big,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                child: Padding(
                  padding: EdgeInsets.only(right: normal),
                  child: CircleAvatar(
                    radius: parentAvatar,
                    backgroundColor: Colors.grey,
                  ),
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
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  print("icon button check");
                },
                padding: const EdgeInsets.fromLTRB(normal, 0, normal, normal),
                constraints: BoxConstraints(),
                icon: Icon(Icons.more_vert),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: parentAvatar * 2 + normal,
              bottom: 6.0,
              right: normal,
            ),
            child: Text(
              "상인엔 있는데 진천에서는 본적 없는것 같아영asdfasdfasdfasasdfasd",
              style: commentStyle,
            ),
          ),
        ],
      ),
    );
  }

  Widget childComment(Comment comment) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        left: big + parentAvatar * 2 + normal,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                child: Padding(
                  padding: EdgeInsets.only(right: normal),
                  child: CircleAvatar(
                    radius: childAvatar,
                    backgroundColor: Colors.grey,
                  ),
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
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  print("icon button check");
                },
                padding: const EdgeInsets.fromLTRB(normal, 0, normal, normal),
                constraints: BoxConstraints(),
                icon: Icon(Icons.more_vert),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: childAvatar * 2 + normal,
              bottom: 6.0,
              right: normal,
            ),
            child: Text(
              "상인엔 있는데 진천에서는 본적 없는것 같아영asdfasdfasdfasasdfasd",
              style: commentStyle,
            ),
          ),
        ],
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
      title: Text(
        "댓글쓰기",
        style: appBarTitle,
      ),
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
                  autofocus: true,
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
