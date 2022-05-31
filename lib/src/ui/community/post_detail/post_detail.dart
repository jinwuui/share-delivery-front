import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/community/post_detail_controller.dart';
import 'package:share_delivery/src/data/model/community/post/post.dart';
import 'package:share_delivery/src/routes/route.dart';
import 'package:share_delivery/src/ui/community/post_detail/post_update.dart';
import 'package:share_delivery/src/ui/theme/button_theme.dart';
import 'package:share_delivery/src/ui/theme/container_theme.dart';
import 'package:share_delivery/src/ui/theme/text_theme.dart';
import 'package:share_delivery/src/utils/time_util.dart';

class PostDetail extends GetView<PostDetailController> {
  const PostDetail({Key? key}) : super(key: key);

  static const double normal = 10.0;
  static const double big = 20.0;
  static const double parentAvatar = 16.0;
  static const double childAvatar = 14.0;

  @override
  Widget build(BuildContext context) {
    Post post = controller.post;

    return SafeArea(
      child: Scaffold(
        appBar: appBar(context),
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
                      profile(post),
                      content(post),
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
      ),
    );
  }

  Widget profile(Post post) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        postTopic(post.category),
        Container(
          decoration: bottomBorderBox,
          margin: const EdgeInsets.only(left: big, right: big),
          padding: const EdgeInsets.only(bottom: big),
          child: Row(
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
                    Text(post.writer.nickname, style: postTitleStyle),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          "매너온도 ${post.writer.mannerScore}",
                          style: postDetailStyle,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.fiber_manual_record,
                            size: 3,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          TimeUtil.timeAgo(post.createdDateTime),
                          style: postDetailStyle,
                        ),
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

  Widget content(Post post) {
    return Container(
      padding: const EdgeInsets.all(big),
      width: double.infinity,
      decoration: bottomBorderBox,
      child: Text(
        post.content,
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
    Comment comment = controller.comments[idx];

    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        bottom: controller.isLastComment(idx) ? 30 : 0,
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
                      padding: const EdgeInsets.only(bottom: 0.0),
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
                    TextButton(
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        Get.toNamed(
                          Routes.WRITING_COMMENT,
                          arguments: comment.parentId,
                        );
                      },
                      child: Text("댓글쓰기"),
                      style: commentBtn,
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

  Widget childComment(int idx) {
    Comment comment = controller.comments[idx];

    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        bottom: controller.isLastComment(idx) ? 30 : 0,
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
          controller.onWriteCommentBar(comment)
              ? writeCommentBar(comment.parentId)
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget writeCommentBar(int parentId) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        Get.toNamed(Routes.WRITING_COMMENT, arguments: parentId);
      },
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: normal),
            child: CircleAvatar(
              radius: childAvatar,
              backgroundColor: Colors.grey,
            ),
          ),
          Expanded(
            child: Container(
              height: childAvatar * 2,
              padding: const EdgeInsets.only(left: normal),
              margin: const EdgeInsets.only(right: big),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: Colors.grey.shade400,
                  width: 1.1,
                ),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "댓글을 입력해주세요.",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.grey.shade500),
                ),
              ),
            ),
          ),
        ],
      ),
    );
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

  PreferredSizeWidget appBar(BuildContext ctx) {
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
        controller.uiType == PostDetailUI.writer || true
            ? IconButton(
                onPressed: () {
                  print("click more_vert");
                  showCupertinoModalPopup(
                    context: ctx,
                    builder: (ctx) => controller.uiType == PostDetailUI.writer
                        ? writerActionSheet()
                        : readerActionSheet(),
                  );
                },
                icon: Icon(Icons.more_vert, color: Colors.black),
              )
            : SizedBox.shrink(),
      ],
    );
  }

  Widget androidActionSheet() {
    return Container(
      color: Colors.red,
      height: Get.height * 0.4,
    );
  }

  CupertinoActionSheet writerActionSheet() {
    return CupertinoActionSheet(
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {
            Get.bottomSheet(
              const PostUpdate(),
              isScrollControlled: true,
              ignoreSafeArea: false,
            );
          },
          child: Text("수정"),
          // isDefaultAction: true,
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            controller.deletePost();
          },
          child: Text("삭제"),
          isDestructiveAction: true,
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        onPressed: () {
          Get.back();
        },
        child: Text("닫기"),
      ),
    );
  }

  CupertinoActionSheet readerActionSheet() {
    return CupertinoActionSheet(
      actions: [
        // CupertinoActionSheetAction(
        //   onPressed: () {
        //     Get.bottomSheet(
        //       const PostUpdate(),
        //       isScrollControlled: true,
        //       ignoreSafeArea: false,
        //     );
        //   },
        //   child: Text("수정"),
        //   // isDefaultAction: true,
        // ),
        CupertinoActionSheetAction(
          onPressed: () {
            controller.deletePost();
          },
          child: Text("신고"),
          isDestructiveAction: true,
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        onPressed: () {
          Get.back();
        },
        child: Text("닫기"),
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
